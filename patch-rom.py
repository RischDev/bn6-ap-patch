import os

rom_file_g = os.path.join(os.path.dirname(__file__), "combined_g.gba")
rom_file_f = os.path.join(os.path.dirname(__file__), "combined_f.gba")
tpi_file_g = os.path.join(os.path.dirname(__file__), "mmbn6cg-us.tpi")
tpi_file_f = os.path.join(os.path.dirname(__file__), "mmbn6cf-us.tpi")


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
	return bin_files


def get_indices(tpi_file):
	sizes = {}
	references = {}
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

			sizes[key] = size
			references[key] = refs
			i += 1
	return sizes, references


def patch_rom(rom_file, tpi_file, version):
	bins = get_bins(version)
	sizes, references = get_indices(tpi_file)

	with open(rom_file, "rb") as rom:
		rom_bytes = bytearray(rom.read())

	# First, blank out all the provided text banks and store them as open banks
	for key, bin in bins.items():
		start = int(key, 16)
		size = int(sizes[key], 16)
		end = start + size
		print("Replacing "+hex(size)+" bytes for bank "+hex(start))
		rom_bytes[start:end] = [0xFF] * size

	# Then, go through all the provided text banks and store them in the smallest available bank
	for key, bin in bins.items():
		print("Injecting text bank "+key)
		size = len(bin)
		refs = references[key]
		start = int(key, 16)
		original_size = int(sizes[key], 16)

		if size < original_size:
			# If it's shorter than the original data, we can pad the difference with 00 and directly replace
			bin.extend([0x00] * (original_size - len(bin)))
			rom_bytes[start:start + len(bin)] = bin
			print("  Injected in place")
		else:
			# It needs to start on a byte divisible by 4. If the rom data is not, add an FF
			while len(rom_bytes) % 4 != 0:
				rom_bytes.append(0xFF)
			new_start_offset = 0x08000000 + len(rom_bytes)
			new_ref = int24_to_byte_list_le(len(rom_bytes))
			print("  New Index "+hex(new_start_offset))
			offset_byte = int32_to_byte_list_le(new_start_offset)
			# Leave a forwarding address where we used to be to point toi the new location
			new_address = bytearray([0xFF, 0xFF])
			new_address.extend(size.to_bytes(2, 'little'))
			new_address.extend(offset_byte)
			rom_bytes[start: start+8] = new_address

			rom_bytes.extend(bin)
			for offset in refs:
				rom_bytes[offset:offset + 3] = new_ref
				print("  Updating reference at "+hex(offset))

	return rom_bytes

# Patch Gregar
if os.path.exists(tpi_file_g) and os.path.exists(rom_file_g):
	new_bytes = patch_rom(rom_file_g, tpi_file_g, "g")
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
	new_bytes = patch_rom(rom_file_f, tpi_file_f, "f")
	with open(os.path.join(os.path.dirname(__file__), "patched_combined_f.gba"), "wb") as new_rom:
		new_rom.write(new_bytes)
		print("New ROM generated at "+new_rom.name)
else:
	if not os.path.exists(tpi_file_f):
		print("No TPI file from TextPET. Copy over from TextPET/indexes/mmbn6cf-us.tpi")
	if not os.path.exists(rom_file_f):
		print("No patched combined_f.gba file found. Copy over results of running openmode_item_combined.asm with armips")