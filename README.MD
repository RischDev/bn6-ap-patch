# bn6-ap-patch
The scripts required to patch Megaman Battle Network 6 to work with the Archipelago Randomizer. This work is heavily based on digiholic's work for the [MMBN3 patch](https://github.com/digiholic/bn3-ap-patch).

# Version
The scripts are designed to patch the US version of `Mega Man Battle Network 6 - Cybeast Gregar` for the GBA. If you are unsure if your version is compatible, the md5 Checksum of the file is this:
```
5acc75848bb1ffd3d6d8705554ee333d
```
If you are not sure how to check the checksum of your file, use [this site](https://emn178.github.io/online-tools/md5_checksum.html)

# Notes
- Certain flags are being re-purposed for the end game state. These flags are listed below, to prevent future confusion.
  - Aquarium exhibits set flags to trigger a cutscene. All of these exhibits have been changed to not set flags, so that they can be re-used for things like the WWW ID navi, and for trade sequence completions so that we can enable them at the beginning of the game.
    - Talking to penguin exhibit flag -> WWW ID bought
    - Talking to shark exhibit flag -> EnrgyBom K trade completed
    - Talking to Dolphin exhibit flag -> DublShot C trade completed
    - Talking to Elephant Seal exhibit flag -> HiBoomer V trade completed
    - Talking to Alligator exhibit flag -> GrabRvng I trade completed

# Usage
Simply place a BN6 ROM named "Megaman Battle Network 6 - Cybeast Gregar (U).gba" into the directory with these scripts, along with a UTF-8 encoded mmbn6cg-us.tpi file from TextPet and installing armips.exe here, and run the batch file. This will output a "patched_combined.gba" ROM that you can test with.
```
python diff.py -apply sourcefile outputfile patchfile
```

The rest of this document will cover what this patch does, and how to generate it in case you make any changes to the constituent scripts.

#Contents

## Assembly files (.asm)
- `open_mode.asm` - Hooks into the New Game function to set the necessary flags to allow access to every area from the beginning of the game. Also sets the game state to after Gregar has been defeated.

### How To use ASM files
Simply put the ROM and the asm file in the same directory as [armips](https://github.com/Kingcom/armips) and run it:
```
./armips.exe ____.asm
```

## TextPET Library Files (.tpl)
These files are meant to be used with Prof9's [TextPET](https://github.com/Prof9/TextPet) program to convert into a MMBN6 text archive.

- `0x73A014 LevBus.tpl` - Changes the LevBus scripts to force certain key items to be required in order to access certain areas. For reference:
  - To go to Seaside, you must have Fish
  - To go to Green, you must have AuthData
  - To go to Sky, you must have Umbrella
  - To go to ACDC, you must have ACDCKyDt
  
### How to use TPL Files
Install TextPET (linked above). Convert the script into binary using this command:
```
./TextPet.exe Read-Text-Archives "______.tpl" --format tpl Write-Text-Archives "______.bin" --format BIN
```
This will generate the file `______.bin`. Since it was generated from a text archive, it will not be compressed. Included is a python script, `lz10.py` that uses [ndspy](https://github.com/RoadrunnerWMC/ndspy) to compress it. If you don't have it, install it via
```
pip install ndspy
```
before running the first time. Once installed, run
```
python lz10.py -compress '______.bin' '______ compressed.bin'
```
To compress the archive. Once compressed, we need to add it to the ROM. Since these text archives are quite a bit bigger than the original text archives, we will need to append them to the ROM and update the pointers. (GBA can natively handle ROMs larger than 8MB, even though the capacity of a standard GBA cart is limited to 8MB, so expanding it will not cause issues on any emulators or on the system itself if loaded via SD card)

Note: to work for BN6, we also need to append a 4-byte header to the binary file prior to compressing it. This is currently done by lz10.py prior to compression, but we can eventually setup a separate script to do this for uncompressed scripts as well.

The six-hex-digit number at the start of the tpl script names denote the original start location of the original text archive. The [documentation for TextPet](https://github.com/Prof9/TextPet/blob/master/TextPet/indexes/mmbn6cg-us.tpi) contains a list of indices for each archive. Look for the indices above and you will see a line like this:
```
0x73A014:&%0x4CC=0x09CAED,0x09D125
```
This means that the text archive starting at location `0x73A014` has a size of `0x4CC` bytes, with `&` denoting that the archive is compressed, and that this is the size of the compressed archive. The `=0x09CAED,0x09D125` indicates that the locations `0x09CAED` and `0x09D125` contains a little-endian reference where this text archive exists. We will need to update the value at this address to point to our new location.

**A note on Little Endian and ROM indexing**
These addresses are six digits long, but the address is expecting a full eight digits. This is because, while running, the GBA will split different kinds of memory into different domains. The ROM is stored in the domain starting with `0x08`, so when referring to any of these addresses in an actual execution context, you will need to prepend `0x08`. Since this is little-endian, this means that you will need to ad `0x08` _after_ your address in little endian format. For example, the above example has the values `34 57 73 08` at location `0x028874`. Make sure to convert the starting address of the archive to this format.

For BN6, I adjusted the script to only update the 6 digit address of the text archive. This is to prevent a crash that happens with the LevBus text scripts; since the ROM should already have to proper first byte in place (such as `0x08`), we shouldn't need to update this. For the LevBus archives, it seems the references had a leading `0x88` instead of `0x08`, which is why it was crashing.