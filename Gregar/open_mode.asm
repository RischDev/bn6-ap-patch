input	equ	"Megaman Battle Network 6 - Cybeast Gregar (U).gba"
fspace	equ	0x7FE400

.gba
.open input,"combined_g.gba",8000000h

.org fspace+8000000h
.align 2

writeStoryFlags:
	;set all the story flags to just after beating Gregar
	ldr r0,=flags			;r0 = addr for flags
	ldr r1,=flagValues		;r1 = addr for flags in ram
	ldr r2, =flagCount		;r2 = address of flag count to set
	ldrb r2, [r2]			;r2 = number of bytes to write
	@@writeloop:
		ldrh r3, [r0]		;r3 = right 2 bytes of flag address
		mov r4, 2h			;r4 = 2
		lsl r4, 24			;r4 = 02000000, AKA start of combined WRAM
		orr r3, r4			;r3 = 0200XXXX, AKA flag address
		ldrb r4, [r1]		;r4 = flag value to set
		strb r4, [r3]		;Write flag value to address
		add r0, 2h			;Increment r0 by 2 to get next flag address, since they are half words
		add r1, 1h			;Increment r1 by 1 to get next value
		sub r2, 1h			;Subtract 1 from byte count
		bne @@writeloop		;Loop until r2 = 0, aka all flags are set
	
	bx lr					;return
	
writeArea:
	;set the area to Lans Room
	ldr r0,=02001B84h		;r0 = addr for area?
	mov r1,01h				;r1 = area?
	strb r1,[r0]			;write r1 into r0
	
	ldr r0,=02001B85h		;r0 = addr for subarea?
	mov r1,2h				;r1 = subarea?
	strb r1,[r0]			;write r1 into r0
	
	bx lr					;return

writeProgress:
	;set the progress byte to post-Gregar
	ldr r1,=02001B86h		;r1 = progress byte addr
	mov r0,64h				;r0 = progress value
	strb r0,[r1]			;write r0 into r1
	
	;set music progress to just before panic
	ldr r1,=02001B87h		;r1 = music progress byte addr
	mov r0,61h				;r0 = progress value
	strb r0,[r1]			;write r0 into r1
	
	;set text archive progress?
	ldr r1,=02001B88h		;r1 = text archive progress byte addr
	mov r0,03h				;r0 = progress value
	strb r0,[r1]			;write r0 into r1
	
	bx lr					;return
	
writeJobs:
	mov r3, 23h
	ldr r1,=020065B0h
	strb r3, [r1]
	
	ldr r2, =jobs			;r0 = address of job values
	ldr r1, =02000290h		;r1 = start address of jobs
	@@writeloop:
		ldrb r0, [r2]
		strb r0, [r1]
		add r1, 1h
		add r2, 1h
		sub r3, 1h
		bne @@writeloop
	
	ldr r1, =02001FF4h
	ldr r4, =02001FFCh
	ldr r2, =jobsFlags
	mov r3, 05h
	@@writeloop2:
		ldrb r0, [r2]
		strb r0, [r1]
		strb r0, [r4]
		add r1, 1h
		add r2, 1h
		add r4, 1h
		sub r3, 1h
		bne @@writeloop2
	
	bx lr					;return
	
writeEmails:
	mov r3, 22h				;r0 = Number of total emails
	ldr r1, =02001140h		;r1 = Address of total emails
	strb r3, [r1]			;Write number of emails to RAM
	
	ldr r2, =emails			;r2 = address of email values
	ldr r1, =02006530h		;r1 = start of email address array in RAM
	@@writeloop:
		ldrb r0, [r2]			;r0 = email value to set
		strb r0, [r1]			;Write email value to array
		add r1, 1h
		add r2, 1h
		sub r3, 1h
		bne @@writeloop
	
	ldr r4, =emailFlags
	ldr r1, =0200201Ch
	ldr r2, =0200203Ch
	mov r3, 0Bh
	@@writeloop2:
		ldrb r0, [r4]
		strb r0, [r1]
		strb r0, [r2]
		add r1, 1h
		add r2, 1h
		add r4, 1h
		sub r3, 1h
		bne @@writeloop2
	
	bx lr
	
writeVirusCounts:
	mov r3, 1Dh				;r3 = Number of total viruses
	ldr r2, =02000071h		;r1 = Start address of virus counts in RAM
	mov r0, 20h				;r0 = 32, value to set
	@@writeloop:
		strb r0, [r2]			;Write email value to array
		add r2, 1h
		sub r3, 1h
		bne @@writeloop
	
	bx lr
	
writeFullLibrary:
	ldr r0, =15Dh
	@@writeAntiCheat:
		ldr r5, =020008A0h
		ldr r3, =02004C20h
		ldrb r1, [r5, r0]
		mov r2, 17h
		eor r1, r2
		strb r1, [r3, r0]
		sub r0, 1h
		bne @@writeAntiCheat
		
	mov r0, 0FFh
	mov r2, 2Ch
	ldr r1, =0200204Ch
	@@setBitFlags:
		strb r0, [r1]
		add r1, 1h
		sub r2, 1h
		bne @@setBitFlags
		
	bx lr
	
writeFolders:
	;Give the player Folder2 & the Extra Folder after pressing new game	
	push lr					;push return addr (r14)
	
	;Load 22h into 0x0201CCDF, which is the normal value when you get the GiftFldr
	mov r0, 22h
	ldr r4,=0x0201CCDF
	strb r0, [r4, 2h]
	
	;load parameters for setfolder function for extrafolder (idk which ones I actually need lmao)
	ldr r0,=0x080425B1		;extrafolder id?
	;ldr r1,=0x00000034
	;ldr r2,=0x08026D34
	;ldr r3,=0x00000002
	;ldr r4,=0x0201CCDF
	ldr r5,=0x02009CD0
	ldr r6,=0x0000FC00
	;ldr r7,=0x080287BC
	
	mov r14,r15				;move PC into LR so that we can return here
	bx r0					;call setfolder(?) function
	
	;Load 22h into 0x0201CCDF, which is the normal value when you get the ExpoFldr
	mov r0, 11h
	ldr r4,=0x0202DF61
	strb r0, [r4, 2h]
	
	;load parameters for setfolder function for extrafolder (idk which ones I actually need lmao)
	ldr r0,=0x080425B1		;extrafolder id?
	;ldr r1,=0x00000034
	;ldr r2,=0x08026D34
	;ldr r3,=0x00000002
	;ldr r4,=0x0201CCDF
	ldr r5,=0x02009CD0
	ldr r6,=0x0000FC00
	;ldr r7,=0x080287BC
	
	mov r14,r15				;move PC into LR so that we can return here
	bx r0					;call setfolder(?) function
	
	;return
	pop r15					;return
	

writeObjectLocations:
	push lr					;push return addr (r14)
	
	;Set Seaside Pavilion Fish locations
	ldr r0,=0x0200112F		;r0 = addr for object locations (1 before due to math)
	mov r1, 20h				;r1 = value for object locations
	mov r2, 9h				;r2 = number of bytes to write
	@@writeloop:
		strb r1, [r0, r2]	;Write value to address
		sub r2, 1h			;Subtract 1 from byte count
		bne @@writeloop		;Loop until r2 = 0, aka all locations are set
		
	;Set Sky Pavilion Cloud Locations
	ldr r0,=0x020018AF		;r0 = addr for object locations (1 before due to math)
	mov r2, 4h				;r2 = number of bytes to write
	@@writeloop2:
		strb r1, [r0, r2]	;Write value to address
		sub r2, 1h			;Subtract 1 from byte count
		bne @@writeloop2	;Loop until r2 = 0, aka all locations are set
		
	pop r15					;return

customRoutine:
	;Complete instruction that would otherwise get overwritten
	strb r1, [r0, r2]
	push r0-r3
	
	bl writeStoryFlags
	bl writeArea
	bl writeProgress
	bl writeJobs
	bl writeEmails
	bl writeVirusCounts
	bl writeFullLibrary
	bl writeFolders
	bl writeObjectLocations
	
	pop r0-r7,r15
	
preventSettingFlags:
	;Complete instructions that would otherwise get overwritten
	lsr r0, r0, 1Dh
	mov r1, 80h
	lsr r1, r0
	ldrb r0, [r3]
	orr r0, r1
	
	; Prevent setting any of the cross or BeastOut flags
	ldr r2, =02001CA4h
	cmp r3, r2
	beq @@return
	ldr r2, =02001CA5h
	cmp r3, r2
	beq @@return

	@@setFlag:
	strb r0, [r3]
	
	@@return:
	pop r0-r3
	mov r15,r14
	
calculateRequestPoints:
	; Store r0-r4 to ensure values don't get lost
	push r0-r7, r14
	
	mov r4, 22h ; Number of total requests, 0-indexed
	mov r5, 0h ; Track request points
	
	; Use flag check function to test if request is completed
	@@checkFlagLoop:
	mov r0, 1Ch
	mov r1, 60h
	add r1, r4
	
	; Recreating checkFlag function since it's too far to branch
	lsl r0, r0, 8h
	orr r0, r1
	mov r3, r10
	ldr r3, [r3, 44h]
	lsr r1, r0, 3h
	add r3, r3, r1
	lsl r0, r0, 1Dh
	lsr r0, r0, 1Dh
	mov r1, 80h
	lsr r1, r0
	ldrb r0, [r3]
	tst r0, r1
	beq @@checkEndLoop ; If flag not set, don't set request points
	
	ldr r1, =requestPointValues ; Address of request point values array
	ldrb r0, [r1, r4] ; Get request point amount of current request
	add r5, r0 ; Add request points to running total
	
	@@checkEndLoop:
	cmp r4, 0h ; Check if r4 is 0 yet
	beq @@return ; Once r4 is 0, then all requests have been checked.
	sub r4, 1h ; Decrement r4
	b @@checkFlagLoop ; Go back and do it again until r4 is 0
	
	@@return:
	ldr r0, =200578Dh ; Address of request point count
	strb r5, [r0] ; Set request points
	pop r0-r7; Pop values before returning
	pop r15; Return
	
.pool

flagCount:
	.db 0x29

.align 4

flags:
	; Set doors to open: Central 1, Seaside 1, Green 1, Undernet 1, ACDC, Graveyard, Teachers Room, Cyber Academy. Also sets LevBus access
	.dh 0x1D15, 0x1C8E, 0x1D97, 0x1E23, 0x1E24, 0x1C98, 0x1C89, 0x1C8A
	; Set dungeon comp obstacles to open: Robo Control, Aquarium, JudgeTree, Mr. Weather, Pavilion
	.dh 0x1D24, 0x1D25, 0x1D45, 0x1D46, 0x1DC6, 0x1DC7, 0x1E07, 0x1E87
	; Set flag to enable Robo Dog Comp. Set flags to enable Security Cam Comp
	.dh 0x1D0B, 0x1D95
	; Enable NaviCust
	.dh 0x1CA6
	; Enable EX Bosses
	.dh 0x1CA8, 0x1CA9
	; Enable Underground access
	.dh 0x1CAC
	; Enable Ms. Fahren and Ms. Zap to spawn
	.dh 0x1D89, 0x1DC8
	; Enable Final Cutscene Door
	.dh 0x1E50
	; Open Lab's Comp 1 Security Cube
	.dh 0x1C96
	; Set TalkToProg flag in Mr. Weather 1
	.dh 0x1E03
	; Set flags to enable trade sequence trades
	.dh 0x1EAD
	; Set flags to enable quizzes
	.dh 0x1EAB, 0x1EAC
	; Set Colonel cutscene flagto enable BassBX
	.dh 0x1E08
	; Technically not a flag, but reset the 2 byte value being used for received index back to 0
	.dh 0x1B60, 0x1B61
	; TEMP - setting these flags to prevent odd textboxes and crashes. Eventually, these will be removed to re-enable dungeon comps
	.dh 0x1D10, 0x1D11, 0x1D12, 0x1D24, 0x1D0F, 0x1D2D, 0x1D2E, 0x1D47
	
flagValues:
	; Set doors to open: Central 1, Seaside 1, Green 1, Undernet 1, ACDC, Graveyard, Teachers Room, Cyber Academy. Also sets LevBus access
	.db 0x00, 0x2F, 0x00, 0x20, 0x00, 0x04, 0x00, 0x00
	; Set dungeon comp obstacles to open: Robo Control, Aquarium, JudgeTree, Mr. Weather, Pavilion
	.db 0xFE, 0x0F, 0x38, 0x07, 0x00, 0x00, 0x00, 0x00
	; Set tutorial cutscene flags to enable Robo Dog Comp. Set flags to enable Security Cam Comp
	.db 0x08, 0x01
	; Enable NaviCust
	.db 0x38
	; Enable EX Bosses
	.db 0x0F, 0xC0
	; Enable Underground access
	.db 0x82
	; Enable Ms. Fahren and Ms. Zap to spawn
	.db 0x02, 0x02
	; Enable Final Cutscene Door
	.db 0x04
	; Open Lab's Comp 1 Security Cube
	.db 0xAF
	; Set TalkToProg flag in Mr. Weather 1
	.db 0x01
	; Set flags to enable trade sequence trades
	.db 0xAA
	; Set flags to enable quizzes
	.db 0x02, 0x80
	; Set Colonel cutscene flag to enable BassBX
	.db 0x80
	; Technically not a flag, but reset the 2 byte value being used for received index back to 0
	.db 0x00, 0x00
	; TEMP - setting these flags to prevent odd textboxes and crashes. Eventually, these will be removed to re-enable dungeon comps
	.db 0x07, 0xFF, 0xE0, 0x00, 0xFF, 0xFF, 0xFF, 0xFE
	
jobs:
	.db 0x00, 0x01, 0x02, 0x03, 0x19, 0x04, 0x05, 0x06, 0x07, 0x1C, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x1E
	.db 0x1B, 0x0D, 0x0E, 0x0F, 0x10, 0x1A, 0x1D, 0x11, 0x12, 0x13, 0x14, 0x1F, 0x20, 0x15, 0x16, 0x17
	.db 0x18, 0x21, 0x22
	
jobsFlags:
	.db 0xFF, 0xFF, 0xFF, 0xFF, 0xE0
	
emails:
	.db 0x56, 0x4B, 0x08, 0x4A, 0x49, 0x48, 0x50, 0x51, 0x47, 0x46, 0x07, 0x4F, 0x3D, 0x4E, 0x06, 0x45
	.db 0x44, 0x43, 0x0C, 0x0B, 0x09, 0x0A, 0x42, 0x05, 0x02, 0x01, 0x41, 0x40, 0x3F, 0x3E, 0x3C, 0x04
	.db 0x00, 0x4D
	
emailFlags:
	.db 0xEF, 0xF8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0xFF, 0xF7, 0xC2
	
requestPointValues:
	.db 0x01, 0x01, 0x01, 0x02, 0x01, 0x01, 0x02, 0x02, 0x01, 0x01, 0x01, 0x02, 0x03, 0x01, 0x01, 0x02 
	.db 0x03, 0x02, 0x02, 0x02, 0x03, 0x04, 0x04, 0x04, 0x04, 0x02, 0x03, 0x03, 0x02, 0x02, 0x01, 0x02 
	.db 0x03, 0x03, 0x03
	
.align 4
.pool
.org 8142774h
mainHook:
	;Set main hook that triggers when you press new game
	ldr r0,=customRoutine|1b
	bx r0

;Prevent setting cross flags and single request flag
.align 4
.pool
.org 802f11Eh
flagHook:
	push r0-r3
	ldr r2, =preventSettingFlags|1b
	bx r2

; Hook into the function that determines if request points should be updated
.align 4
.pool
.org 8142698h
requestPointHook:
	ldr r0, =calculateRequestPoints|1b
	mov r14, r15
	bx r0
	pop r4-r7, r15 ; Call the return function afterwards,

.pool

; Make the game thinks your "Currently selected request" is always finished, so it checks if you should rank up.
.org 8142640h
mov r0, 1h

; Set this line so that the game checks a different flag when deciding if a request can be grabbed. Look at canary byte 1D09, which should always be 0x00 (flag 1032, or 0x408)
.org 81426F6h
mov r0, 04h
.org 81426F8h
mov r1, 08h

; Skip over clearing the flag that indicates a request has been grabbed
.org 814128Ah
mov r0, r0
mov r0, r0

; Overwrite the flag checks for Bass BX to not check for Cybeast icon flag, and instead looks at Colonel cutscene flag twice
.org 807A8DAh
.dh 0x0C00
.org 807A813h
.dh 0x0C00
.org 807A84Bh
.dh 0x0C00

; Skip the line that resets last selected request back to 0 when the job is complete. Otherwise, our hook for updating request points won't get called, which can lead to a player getting stuck if they complete all open requests without s
.org 8141294h
mov r0, r0

; Overwrite flag checks for Link Navi upgrades
.org 8122F1Ch
.dh 0x0465

.org 8122F18h
.dh 0x0464

.org 8122F14h
.dh 0x0463

.org 8122F10h
.dh 0x0462

;Hold off on these for now
;.org 80674C3h
;.db 0x64

;.org 80674B7h
;.db 0x64

;.org 8067685h
;.db 0x64

;.org 8067698h
;.db 0x64

;Close file and finish
.close