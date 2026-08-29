import os
import json
from operator import truediv

rom_file_g = os.path.join(os.path.dirname(__file__), "combined_g.gba")
rom_file_f = os.path.join(os.path.dirname(__file__), "combined_f.gba")
tpi_file_g = os.path.join(os.path.dirname(__file__), "mmbn6cg-us.tpi")
tpi_file_f = os.path.join(os.path.dirname(__file__), "mmbn6cf-us.tpi")
gregar_archive_data_f = os.path.join(os.path.dirname(__file__), "gregarArchiveData.json")
falzar_archive_data_f = os.path.join(os.path.dirname(__file__), "falzarArchiveData.json")



def update_archive_data(sizes, references, compressed, archive_data_file, rom_bytes):
    archive_data = {}
    with open(archive_data_file, "r") as json_data:
        archive_data = json.load(json_data)

    for archiveKey in archive_data:
        key = archiveKey.replace("0x", "")
        size = int(sizes[key], 16)
        start = int(key, 16)
        end = start + size

        archive_data[archiveKey]["size"] = "0x" + str(size)
        archive_data[archiveKey]["compressed"] = compressed[key]
        archive_data[archiveKey]["references"] = references[key]
        archive_data[archiveKey]["bytes"] = list(rom_bytes[start:end])

    return archive_data


def int32_to_byte_list_le(x) -> bytearray:
    byte32_string = "{:08x}".format(x)
    data = bytearray.fromhex(byte32_string)
    data.reverse()
    return data

def int24_to_byte_list_le(x) -> bytearray:
    byte24_string = "{:06x}".format(x)
    data = bytearray.fromhex(byte24_string)
    data.reverse()
    return data


def get_bins(version):
    bin_files = {}

    if version == "g":
        for f in os.scandir(os.path.join(os.path.dirname(__file__), "Gregar")):
            if f.name.endswith(".bin"):
                tag = f.name.split(' ')[0]
                with open("Gregar/" + f.name, "rb") as bin_file:
                    bin_files[tag] = bytearray(bin_file.read())
    elif version == "f":
        for f in os.scandir(os.path.join(os.path.dirname(__file__), "Falzar")):
            if f.name.endswith(".bin"):
                tag = f.name.split(' ')[0]
                with open("Falzar/" + f.name, "rb") as bin_file:
                    bin_files[tag] = bytearray(bin_file.read())
                    
    #print(len(bin_files))
    return bin_files


def get_indices(tpi_file):
    sizes = {}
    references = {}
    compressed = {}
    with open(tpi_file, "r") as tpi:
        i = 0
        for line in tpi.readlines():
            if line.startswith("//"):
                continue
            splitrow = line.split(':')
            key = splitrow[0][2:]
            datarow = splitrow[1].split('=')
            size = datarow[0].replace('&', '').replace('%', '')[2:]
            refs = []
            for ref in datarow[1].split(','):
                ref = ref.strip()
                if len(ref) > 0:
                    refs.append(int(ref, 16))

            if "&" in line:
                compressed[key] = True
            else:
                compressed[key] = False

            sizes[key] = size
            references[key] = refs
            i += 1
    return sizes, references, compressed


def patch_rom(rom_file, tpi_file, archive_data_file, version):
    bins = get_bins(version)
    sizes, references, compressed = get_indices(tpi_file)

    with open(rom_file, "rb") as rom:
        rom_bytes = bytearray(rom.read())

    archive_data = update_archive_data(sizes, references, compressed, archive_data_file, rom_bytes)

    # First, blank out all the provided text banks and store them as open banks
    for key, bin in bins.items():
        start = int(key, 16)
        size = int(sizes[key], 16)
        end = start + size
        #print("Replacing "+hex(size)+" bytes for bank "+hex(start))
        rom_bytes[start:end] = [0xFF] * size

    # Then, go through all the provided text banks and store them in the smallest available bank
    for key, bin in bins.items():
       # print("Injecting text bank "+key)
        size = len(bin)
        refs = references[key]
        start = int(key, 16)
        original_size = int(sizes[key], 16)

        if size < original_size:
            # If it's shorter than the original data, we can pad the difference with 00 and directly replace
            bin.extend([0x00] * (original_size - len(bin)))
            rom_bytes[start:start + len(bin)] = bin
            #print("  Injected in place")
			
            # Update archive data with new bin data
            archiveKey = "0x" + key
            if archiveKey in archive_data:
                archive_data[archiveKey]["bytes"] = list(bin)
        else:
            # It needs to start on a byte divisible by 4. If the rom data is not, add an FF
            while len(rom_bytes) % 4 != 0:
                rom_bytes.append(0xFF)
            new_start_offset = 0x08000000 + len(rom_bytes)
            new_ref = int24_to_byte_list_le(len(rom_bytes))
            #print("  New Index "+hex(new_start_offset))
            offset_byte = int32_to_byte_list_le(new_start_offset)
            # Leave a forwarding address where we used to be to point toi the new location
            new_address = bytearray([0xFF, 0xFF])
            new_address.extend(size.to_bytes(2, 'little'))
            new_address.extend(offset_byte)
            rom_bytes[start: start+8] = new_address

            rom_bytes.extend(bin)
            for offset in refs:
                rom_bytes[offset:offset + 3] = new_ref
                #print("  Updating reference at "+hex(offset))

            # Update archive data with new offset and bin data
            archiveKey = "0x" + key
            if archiveKey in archive_data:
                archive_data[archiveKey]["offset"] = hex(new_start_offset).upper().replace('X', 'x')
                archive_data[archiveKey]["size"] = hex(size).upper().replace('X', 'x')
                archive_data[archiveKey]["bytes"] = list(bin)   

    # Write archive_data back to file
    with open(archive_data_file, "w", encoding="utf-8") as file:
        json.dump(archive_data, file)
        
    # Pad out space until 0x810000, so that we can start at a safe place in the apworld patch
    while len(rom_bytes) < 0x820000:
        rom_bytes.append(0xFF)

    return rom_bytes

# Patch Gregar
if os.path.exists(tpi_file_g) and os.path.exists(rom_file_g):
    new_bytes = patch_rom(rom_file_g, tpi_file_g, gregar_archive_data_f, "g")
    print(f"New Gregar ROM length: {hex(len(new_bytes))}")
    if len(new_bytes) > 0x820000:
        print("WARNING: Base patch is too large. Please consider changing the padding length, and update the apworld accordingly.")
    with open(os.path.join(os.path.dirname(__file__), "patched_combined_g.gba"), "wb") as new_rom:
        new_rom.write(new_bytes)
        print("New ROM generated at "+new_rom.name)
else:
    if not os.path.exists(tpi_file_g):
        print("No TPI file from TextPET. Copy over from TextPET/indexes/mmbn6cg-us.tpi")
    if not os.path.exists(rom_file_g):
        print("No patched combined_g.gba file found. Copy over results of running openmode_item_combined.asm with armips")

# Patch Falzar
if os.path.exists(tpi_file_f) and os.path.exists(rom_file_f):
    new_bytes = patch_rom(rom_file_f, tpi_file_f, falzar_archive_data_f, "f")
    print(f"New Falzar ROM length: {hex(len(new_bytes))}")
    if len(new_bytes) > 0x820000:
        print("WARNING: Base patch is too large. Please consider changing the padding length, and update the apworld accordingly.")
    with open(os.path.join(os.path.dirname(__file__), "patched_combined_f.gba"), "wb") as new_rom:
        new_rom.write(new_bytes)
        print("New ROM generated at "+new_rom.name)
else:
    if not os.path.exists(tpi_file_f):
        print("No TPI file from TextPET. Copy over from TextPET/indexes/mmbn6cf-us.tpi")
    if not os.path.exists(rom_file_f):
        print("No patched combined_f.gba file found. Copy over results of running openmode_item_combined.asm with armips")
