@archive 754BD8
@size 116

script 0 mmbn6 {
	msgOpen
	"""
	There are pictures
	of various viruses
	on this giant panel.
	"""
	keyWait
		any = false
	clearMsg
	"""
	There's also short
	descriptions,so it's
	very informative!
	"""
	keyWait
		any = false
	end
}
script 1 mmbn6 {
	msgOpen
	"""
	The chips in this
	case aren't as
	popular any more...
	"""
	keyWait
		any = false
	clearMsg
	"""
	so they're being
	sold at bargain
	prices!
	"""
	keyWait
		any = false
	end
}
script 2 mmbn6 {
	msgOpen
	"""
	A magazine rack
	stacked full of
	chip magazines.
	"""
	keyWait
		any = false
	clearMsg
	"""
	"Chips Monthly",
	"Chip Club Weekly",
	just to name two...
	"""
	keyWait
		any = false
	end
}
script 3 mmbn6 {
	msgOpen
	"""
	BattleChips are on
	display in this
	showcase.
	"""
	keyWait
		any = false
	clearMsg
	"""
	These chips are
	wanted by Net-
	Battlers everywhere!
	"""
	keyWait
		any = false
	end
}
script 4 mmbn6 {
	msgOpen
	"""
	The register is
	locked tight.
	"""
	keyWait
		any = false
	end
}
script 5 mmbn6 {
	msgOpen
	"""
	The chips in this
	showcase are all
	"""
	keyWait
		any = false
	clearMsg
	"""
	of premium quality
	and are very rare
	and expensive.
	"""
	keyWait
		any = false
	end
}
script 6 mmbn6 {
	checkFlag
		flag = 355
		jumpIfTrue = 9
		jumpIfFalse = continue
	msgOpen
	"""
	A request board.
	Various requests
	have been left...
	"""
	keyWait
		any = false
	clearMsg
	startRequestBBS
		bbs = 0
	end
}
script 7 mmbn6s {
	end
}
script 8 mmbn6 {
	msgOpen
	"""
	A table where you
	can place chips.
	"""
	keyWait
		any = false
	clearMsg
	"""
	You use it when you
	trade chips with a
	friend,it seems.
	"""
	keyWait
		any = false
	end
}
script 9 mmbn6 {
	msgOpen
	"Warning!"
	keyWait
		any = false
	clearMsg
	"""
	You can only accept
	requests through
	BeastLink Gate
	"""
	keyWait
		any = false
	clearMsg
	"""
	while operating
	MegaMan.
	"""
	keyWait
		any = false
	end
}
script 10 mmbn6 {
	msgOpen
	"Welcome!\n\n"
	option
		brackets = 0
		left = 1
		right = 1
		up = 1
		down = 1
	space
		count = 20
	" "
	option
		brackets = 0
		left = 1
		right = 1
		up = 1
		down = 1
	space
		count = 20
	" "
	select
		default = 1
		BSeparate = false
		disableB = true
		clear = true
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 11 mmbn6 {
	msgOpenQuick
	"""
	Buy an ultra-rare
	pull for 500z?
	
	"""
	option
		brackets = 0
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"Yes "
	option
		brackets = 0
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"No"
	select
		default = 0
		BSeparate = false
		disableB = false
		clear = true
		targets = [
			jump = 54,
			jump = 53,
			jump = continue
		]
	end
}
script 12 mmbn6 {
	msgOpenQuick
	"Enter lotto number."
	keyWait
		any = false
	clearMsg
	option
		brackets = 1
		left = 8
		right = 1
		up = 0
		down = 0
	space
		count = 1
	menuOptionNumberTrader
		char = 0
	"0"
	option
		brackets = 1
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 1
	menuOptionNumberTrader
		char = 1
	"0"
	option
		brackets = 1
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 1
	menuOptionNumberTrader
		char = 2
	"0"
	option
		brackets = 1
		left = 2
		right = 4
		up = 3
		down = 3
	space
		count = 1
	menuOptionNumberTrader
		char = 3
	"0"
	option
		brackets = 1
		left = 3
		right = 5
		up = 4
		down = 4
	space
		count = 1
	menuOptionNumberTrader
		char = 4
	"0"
	option
		brackets = 1
		left = 4
		right = 6
		up = 5
		down = 5
	space
		count = 1
	menuOptionNumberTrader
		char = 5
	"0"
	option
		brackets = 1
		left = 5
		right = 7
		up = 6
		down = 6
	space
		count = 1
	menuOptionNumberTrader
		char = 6
	"0"
	option
		brackets = 1
		left = 6
		right = 8
		up = 7
		down = 7
	space
		count = 1
	menuOptionNumberTrader
		char = 7
	"0"
	option
		brackets = 1
		left = 7
		right = 0
		up = 8
		down = 8
	space
		count = 1
	"""
	 OK
	(UP/DOWN:Number
	 LEFT/RIGHT:Cursor)
	"""
	flagSet
		flag = 5925
	menuSelectNumberTrader
	waitHold
}
script 13 mmbn6 {
	msgOpenQuick
	"""
	Checking your
	lotto number!
	*beep beep...*
	"""
	keyWait
		any = false
	clearMsg
	"""
	Too bad! You lost.
	Try again?
	
	"""
	positionOptionHorizontal
		width = 8
	option
		brackets = 0
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 1
	" Yes  "
	option
		brackets = 0
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 1
	" No"
	select
		default = 0
		BSeparate = false
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 20 mmbn6 {
	msgOpenQuick
	"""
	Checking your
	lotto number!
	*beep beep...*
	"""
	keyWait
		any = false
	clearMsg
	"""
	This number's been
	entered already.
	"""
	keyWait
		any = false
	clearMsg
	"Try again?\n"
	positionOptionHorizontal
		width = 8
	option
		brackets = 0
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 1
	" Yes  "
	option
		brackets = 0
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 1
	" No"
	select
		default = 0
		BSeparate = false
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 25 mmbn6s {
	printBuffer
		buffer = 0
		minLength = 6
		padZeros = false
		padLeft = true
	end
}
script 30 mmbn6 {
	checkFlag
		flag = 355
		jumpIfTrue = 36
		jumpIfFalse = continue
	msgOpen
	"""
	A Navi Change Box.
	"Insert a NaviChip"
	is written on it.
	"""
	keyWait
		any = false
	clearMsg
	"""
	Insert a NaviChip
	into the slot?
	
	"""
	positionOptionHorizontal
		width = 7
	option
		brackets = 0
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 1
	" Yes  "
	option
		brackets = 0
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 1
	" No"
	select
		default = 0
		BSeparate = false
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 31 mmbn6 {
	msgOpenQuick
	"""
	Checking your
	BeastLink Gate
	connection...
	"""
	waitHold
}
script 32 mmbn6 {
	msgOpenQuick
	msgClose
	end
}
script 33 mmbn6 {
	msgOpenQuick
	"Communication error."
	keyWait
		any = false
	clearMsg
	"""
	Please check your
	BeastLink Gate
	connection.
	"""
	keyWait
		any = false
	end
}
script 34 mmbn6 {
	msgOpenQuick
	"""
	Please insert a
	NaviChip.
	(Press B to cancel)
	"""
	waitHold
}
script 35 mmbn6 {
	msgOpenQuick
	"""
	Navi data confirmed!
	Installing 
	"""
	printNavi
		buffer = 1
		navi = 0
	"\ninto your PET!"
	keyWait
		any = false
	clearMsg
	checkNaviAll
		jumpIfMegaMan = 37
		jumpIfHeatMan = 38
		jumpIfElecMan = 39
		jumpIfSlashMan = 40
		jumpIfEraseMan = 41
		jumpIfChargeMan = 42
		jumpIfSpoutMan = 43
		jumpIfTomahawkMan = 44
		jumpIfTenguMan = 45
		jumpIfGroundMan = 46
		jumpIfDustMan = 47
		jumpIfProtoMan = 48
}
script 36 mmbn6 {
	msgOpen
	"A Navi Change Box.\n"
	option
		brackets = 0
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 1
	"Quit Navi Change\n"
	option
		brackets = 0
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 1
	"Confirm Navi Change"
	select
		default = 0
		BSeparate = true
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 37 mmbn6 {
	mugshotShow
		mugshot = MegaMan
	msgOpenQuick
	"""
	I'm MegaMan,and I'm
	your Navi! It's good
	to work with you!
	"""
	keyWait
		any = false
	clearMsg
	mugshotShow
		mugshot = Lan
	"""
	It's good to work
	with you too,
	MegaMan!
	"""
	keyWait
		any = false
	clearMsg
	"""
	... Uh,tell me why
	we're being so
	formal again...?
	"""
	keyWait
		any = false
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Because it's good
	to be nice,even to
	your best friends!
	"""
	keyWait
		any = false
	clearMsg
	mugshotShow
		mugshot = Lan
	"Right!"
	keyWait
		any = false
	waitHold
}
script 38 mmbn6 {
	mugshotShow
		mugshot = HeatMan
	msgOpenQuick
	"""
	Buuuuuuurning!
	I'm HeatMan,and
	I'm all fired up!
	"""
	keyWait
		any = false
	waitHold
}
script 39 mmbn6 {
	mugshotShow
		mugshot = ElecMan
	msgOpenQuick
	"""
	... I am ElecMan.
	It's time to sizzle
	some viruses...
	"""
	keyWait
		any = false
	waitHold
}
script 40 mmbn6 {
	mugshotShow
		mugshot = SlashMan
	msgOpenQuick
	"""
	Hey,I'm SlashMan!
	Viruses beware! I'll
	slice you to shreds!
	"""
	keyWait
		any = false
	waitHold
}
script 41 mmbn6 {
	mugshotShow
		mugshot = EraseMan
	msgOpenQuick
	"""
	Hiyahahaha!
	I'm EraseMan! Why?
	Because I "erase"...
	"""
	keyWait
		any = false
	waitHold
}
script 42 mmbn6 {
	mugshotShow
		mugshot = ChargeMan
	msgOpenQuick
	"""
	Choo,choo!
	I'm ChargeMan,and
	I'm here to help!
	"""
	keyWait
		any = false
	waitHold
}
script 43 mmbn6 {
	mugshotShow
		mugshot = SpoutMan
	msgOpenQuick
	"""
	Drip,drip!
	I'm SpoutMan,if you
	please,drip!
	"""
	keyWait
		any = false
	waitHold
}
script 44 mmbn6 {
	mugshotShow
		mugshot = TomahawkMan
	msgOpenQuick
	"""
	Yeow,yeah! I'm
	TomahawkMan! Let's
	get chopping!
	"""
	keyWait
		any = false
	waitHold
}
script 45 mmbn6 {
	mugshotShow
		mugshot = TenguMan
	msgOpenQuick
	"""
	I am TenguMan.
	I hope we will work
	together in harmony.
	"""
	keyWait
		any = false
	waitHold
}
script 46 mmbn6 {
	mugshotShow
		mugshot = GroundMan
	msgOpenQuick
	"""
	Whiiiiiiir!
	I'm GroundMan,and
	I'm ready to drill!
	"""
	keyWait
		any = false
	waitHold
}
script 47 mmbn6 {
	mugshotShow
		mugshot = DustMan
	msgOpenQuick
	"""
	Gahahahaha!
	I'm the Master of
	Crushing,DustMan!
	"""
	keyWait
		any = false
	waitHold
}
script 48 mmbn6 {
	mugshotShow
		mugshot = ProtoMan
	msgOpenQuick
	"ProtoMan here!"
	keyWait
		any = false
	clearMsg
	"""
	Always good to work
	with you,however,
	"""
	keyWait
		any = false
	clearMsg
	"""
	I will stay by
	Chaud's side
	until the end...
	"""
	keyWait
		any = false
	clearMsg
	"""
	I will only appear
	during battle.
	"""
	keyWait
		any = false
	clearMsg
	"""
	I'll leave the
	navigation
	to MegaMan.
	"""
	keyWait
		any = false
	clearMsg
	mugshotShow
		mugshot = MegaMan
	"""
	Roger! Which means
	outside of battles,I
	will be the Navi.
	"""
	keyWait
		any = false
	waitHold
}
script 49 mmbn6 {
	msgOpenQuick
	"""
	Returning to
	MegaMan.
	"""
	keyWait
		any = false
	end
}
script 50 mmbn6 {
	msgOpenQuick
	"""
	The equipped Folder
	can't be used
	anymore.
	"""
	keyWait
		any = false
	clearMsg
	"""
	You don't have an
	Extra Folder,so
	take this folder!
	"""
	keyWait
		any = false
	clearMsg
	"""
	Lan got:
	"
	"""
	printFolderName
		buffer = 0
		entry = 2
	"\"!!"
	keyWait
		any = false
	clearMsg
	"""
	Switching to this
	Folder.
	"""
	keyWait
		any = false
	waitHold
}
script 51 mmbn6 {
	msgOpenQuick
	"""
	The equipped Folder
	can't be used
	anymore.
	"""
	keyWait
		any = false
	clearMsg
	"""
	The Extra Folder
	also can't be used,
	so take this Folder!
	"""
	keyWait
		any = false
	clearMsg
	"""
	Lan got:
	"
	"""
	printFolderName
		buffer = 0
		entry = 2
	"\"!!"
	keyWait
		any = false
	clearMsg
	"""
	Switching to this
	Folder.
	"""
	keyWait
		any = false
	waitHold
}
script 52 mmbn6 {
	msgOpenQuick
	"""
	The equipped Folder
	can't be used.
	"""
	keyWait
		any = false
	clearMsg
	"""
	Switching to Extra
	Folder.
	"""
	keyWait
		any = false
	waitHold
}
script 53 mmbn6 {
	callDisableMugshotBrighten
	msgOpenQuick
	"""
	Please come back!
	I'll be waiting!
	"""
	keyWait
		any = false
	end
}
script 54 mmbn6 {
	checkFlag
		flag = 9817
		jumpIfTrue = 55
		jumpIfFalse = continue
	checkTakeZenny
		amount = 500
		jumpIfAll = 57
		jumpIfNone = 56
		jumpIfSome = 56
}
script 55 mmbn6 {
	msgOpenQuick
	"""
	That's everything!
	You've bought every
	prize!
	"""
	keyWait
		any = false
	clearMsg
	"""
	Who's a good whale?
	You are!
	"""
	keyWait
		any = false
	end
}
script 56 mmbn6 {
	callDisableMugshotBrighten
	msgOpenQuick
	"""
	Try coming back when
	you get some money,
	buddy!!
	"""
	keyWait
		any = false
	end
}
script 57 mmbn6 {
	msgOpenQuick
	"""
	Processing money!
	*beep beep beep*
	"""
	keyWait
		any = false
	clearMsg
	"""
	Processed! Winning
	money detected!
	Take your prize!
	"""
	keyWait
		any = false
	clearMsg
	mugshotHide
	soundDisableTextSFX
	soundPlay
		track = 213
	"Whir-whir... Clunk!"
	soundEnableTextSFX
	keyWait
		any = false
	clearMsg
	checkFlag
		flag = 9760
		jumpIfTrue = continue
		jumpIfFalse = 58
	checkFlag
		flag = 9761
		jumpIfTrue = continue
		jumpIfFalse = 59
	checkFlag
		flag = 9762
		jumpIfTrue = continue
		jumpIfFalse = 60
	checkFlag
		flag = 9763
		jumpIfTrue = continue
		jumpIfFalse = 61
	checkFlag
		flag = 9764
		jumpIfTrue = continue
		jumpIfFalse = 62
	checkFlag
		flag = 9765
		jumpIfTrue = continue
		jumpIfFalse = 63
	checkFlag
		flag = 9766
		jumpIfTrue = continue
		jumpIfFalse = 64
	checkFlag
		flag = 9767
		jumpIfTrue = continue
		jumpIfFalse = 65
	checkFlag
		flag = 9768
		jumpIfTrue = continue
		jumpIfFalse = 66
	checkFlag
		flag = 9769
		jumpIfTrue = continue
		jumpIfFalse = 67
	checkFlag
		flag = 9770
		jumpIfTrue = continue
		jumpIfFalse = 68
	checkFlag
		flag = 9771
		jumpIfTrue = continue
		jumpIfFalse = 69
	checkFlag
		flag = 9772
		jumpIfTrue = continue
		jumpIfFalse = 70
	checkFlag
		flag = 9773
		jumpIfTrue = continue
		jumpIfFalse = 71
	checkFlag
		flag = 9774
		jumpIfTrue = continue
		jumpIfFalse = 72
	checkFlag
		flag = 9775
		jumpIfTrue = continue
		jumpIfFalse = 73
	checkFlag
		flag = 9776
		jumpIfTrue = continue
		jumpIfFalse = 74
	checkFlag
		flag = 9777
		jumpIfTrue = continue
		jumpIfFalse = 75
	checkFlag
		flag = 9778
		jumpIfTrue = continue
		jumpIfFalse = 76
	checkFlag
		flag = 9779
		jumpIfTrue = continue
		jumpIfFalse = 77
	checkFlag
		flag = 9780
		jumpIfTrue = continue
		jumpIfFalse = 78
	checkFlag
		flag = 9781
		jumpIfTrue = continue
		jumpIfFalse = 79
	checkFlag
		flag = 9782
		jumpIfTrue = continue
		jumpIfFalse = 80
	checkFlag
		flag = 9783
		jumpIfTrue = continue
		jumpIfFalse = 81
	checkFlag
		flag = 9784
		jumpIfTrue = continue
		jumpIfFalse = 82
	checkFlag
		flag = 9785
		jumpIfTrue = continue
		jumpIfFalse = 83
	checkFlag
		flag = 9786
		jumpIfTrue = continue
		jumpIfFalse = 84
	checkFlag
		flag = 9787
		jumpIfTrue = continue
		jumpIfFalse = 85
	checkFlag
		flag = 9788
		jumpIfTrue = continue
		jumpIfFalse = 86
	checkFlag
		flag = 9789
		jumpIfTrue = continue
		jumpIfFalse = 87
	checkFlag
		flag = 9790
		jumpIfTrue = continue
		jumpIfFalse = 88
	checkFlag
		flag = 9791
		jumpIfTrue = continue
		jumpIfFalse = 89
	checkFlag
		flag = 9792
		jumpIfTrue = continue
		jumpIfFalse = 90
	checkFlag
		flag = 9793
		jumpIfTrue = continue
		jumpIfFalse = 91
	checkFlag
		flag = 9794
		jumpIfTrue = continue
		jumpIfFalse = 92
	checkFlag
		flag = 9795
		jumpIfTrue = continue
		jumpIfFalse = 93
	checkFlag
		flag = 9796
		jumpIfTrue = continue
		jumpIfFalse = 94
	checkFlag
		flag = 9797
		jumpIfTrue = continue
		jumpIfFalse = 95
	checkFlag
		flag = 9798
		jumpIfTrue = continue
		jumpIfFalse = 96
	checkFlag
		flag = 9799
		jumpIfTrue = continue
		jumpIfFalse = 97
	checkFlag
		flag = 9800
		jumpIfTrue = continue
		jumpIfFalse = 98
	checkFlag
		flag = 9801
		jumpIfTrue = continue
		jumpIfFalse = 99
	checkFlag
		flag = 9802
		jumpIfTrue = continue
		jumpIfFalse = 100
	checkFlag
		flag = 9803
		jumpIfTrue = continue
		jumpIfFalse = 101
	checkFlag
		flag = 9804
		jumpIfTrue = continue
		jumpIfFalse = 102
	checkFlag
		flag = 9805
		jumpIfTrue = continue
		jumpIfFalse = 103
	checkFlag
		flag = 9806
		jumpIfTrue = continue
		jumpIfFalse = 104
	checkFlag
		flag = 9807
		jumpIfTrue = continue
		jumpIfFalse = 105
	checkFlag
		flag = 9808
		jumpIfTrue = continue
		jumpIfFalse = 106
	checkFlag
		flag = 9809
		jumpIfTrue = continue
		jumpIfFalse = 107
	checkFlag
		flag = 9810
		jumpIfTrue = continue
		jumpIfFalse = 108
	checkFlag
		flag = 9811
		jumpIfTrue = continue
		jumpIfFalse = 109
	checkFlag
		flag = 9812
		jumpIfTrue = continue
		jumpIfFalse = 110
	checkFlag
		flag = 9813
		jumpIfTrue = continue
		jumpIfFalse = 111
	checkFlag
		flag = 9814
		jumpIfTrue = continue
		jumpIfFalse = 112
	checkFlag
		flag = 9815
		jumpIfTrue = continue
		jumpIfFalse = 113
	checkFlag
		flag = 9816
		jumpIfTrue = continue
		jumpIfFalse = 114
	checkFlag
		flag = 9817
		jumpIfTrue = continue
		jumpIfFalse = 115
	end
}
script 58 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 129
	"\"!!"
	itemGive
		item = 129
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9760
	end
}
script 59 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 129
	"\"!!"
	itemGive
		item = 129
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9761
	end
}
script 60 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 129
	"\"!!"
	itemGive
		item = 129
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9762
	end
}
script 61 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 130
	"\"!!"
	itemGive
		item = 130
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9763
	end
}
script 62 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 130
	"\"!!"
	itemGive
		item = 130
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9764
	end
}
script 63 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 130
	"\"!!"
	itemGive
		item = 130
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9765
	end
}
script 64 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 131
	"\"!!"
	itemGive
		item = 131
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9766
	end
}
script 65 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 131
	"\"!!"
	itemGive
		item = 131
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9767
	end
}
script 66 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 131
	"\"!!"
	itemGive
		item = 131
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9768
	end
}
script 67 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 132
	"\"!!"
	itemGive
		item = 132
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9769
	end
}
script 68 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 132
	"\"!!"
	itemGive
		item = 132
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9770
	end
}
script 69 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 132
	"\"!!"
	itemGive
		item = 132
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9771
	end
}
script 70 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 132
	"\"!!"
	itemGive
		item = 132
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9772
	end
}
script 71 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 133
	"\"!!"
	itemGive
		item = 133
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9773
	end
}
script 72 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 133
	"\"!!"
	itemGive
		item = 133
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9774
	end
}
script 73 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 133
	"\"!!"
	itemGive
		item = 133
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9775
	end
}
script 74 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got a
	SubChip for
	"
	"""
	printItem
		buffer = 0
		item = 133
	"\"!!"
	itemGive
		item = 133
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9776
	end
}
script 75 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 27
	"\"!!"
	itemGiveNaviCustProgram
		program = 108
		color = 4
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9777
	end
}
script 76 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 28
	"\"!!"
	itemGiveNaviCustProgram
		program = 112
		color = 3
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9778
	end
}
script 77 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 32
	"\"!!"
	itemGiveNaviCustProgram
		program = 128
		color = 2
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9779
	end
}
script 78 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 33
	"\"!!"
	itemGiveNaviCustProgram
		program = 132
		color = 5
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9780
	end
}
script 79 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 34
	"\"!!"
	itemGiveNaviCustProgram
		program = 136
		color = 6
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9781
	end
}
script 80 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 39
	"\"!!"
	itemGiveNaviCustProgram
		program = 156
		color = 6
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9782
	end
}
script 81 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 40
	"\"!!"
	itemGiveNaviCustProgram
		program = 160
		color = 5
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9783
	end
}
script 82 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 41
	"\"!!"
	itemGiveNaviCustProgram
		program = 164
		color = 3
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9784
	end
}
script 83 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 42
	"\"!!"
	itemGiveNaviCustProgram
		program = 168
		color = 1
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9785
	end
}
script 84 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 43
	"\"!!"
	itemGiveNaviCustProgram
		program = 172
		color = 1
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9786
	end
}
script 85 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 44
	"\"!!"
	itemGiveNaviCustProgram
		program = 176
		color = 3
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9787
	end
}
script 86 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 45
	"\"!!"
	itemGiveNaviCustProgram
		program = 180
		color = 6
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9788
	end
}
script 87 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printNaviCustProgram
		buffer = 0
		program = 46
	"\"!!"
	itemGiveNaviCustProgram
		program = 184
		color = 1
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9789
	end
}
script 88 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 51
	" "
	printCode
		buffer = 0
		code = M
	"\"!!"
	itemGiveChip
		chip = 51
		code = M
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9790
	end
}
script 89 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 128
	" "
	printCode
		buffer = 0
		code = O
	"\"!!"
	itemGiveChip
		chip = 128
		code = O
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9791
	end
}
script 90 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 118
	" "
	printCode
		buffer = 0
		code = M
	"\"!!"
	itemGiveChip
		chip = 118
		code = M
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9792
	end
}
script 91 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 17
	" "
	printCode
		buffer = 0
		code = W
	"\"!!"
	itemGiveChip
		chip = 17
		code = W
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9793
	end
}
script 92 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 167
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 167
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9794
	end
}
script 93 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 185
	" "
	printCode
		buffer = 0
		code = G
	"\"!!"
	itemGiveChip
		chip = 185
		code = G
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9795
	end
}
script 94 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 197
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 197
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9796
	end
}
script 95 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 198
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 198
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9797
	end
}
script 96 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 201
	" "
	printCode
		buffer = 0
		code = M
	"\"!!"
	itemGiveChip
		chip = 201
		code = M
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9798
	end
}
script 97 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 161
	" "
	printCode
		buffer = 0
		code = Y
	"\"!!"
	itemGiveChip
		chip = 161
		code = Y
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9799
	end
}
script 98 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 119
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 119
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9800
	end
}
script 99 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 142
	" "
	printCode
		buffer = 0
		code = V
	"\"!!"
	itemGiveChip
		chip = 142
		code = V
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9801
	end
}
script 100 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 199
	" "
	printCode
		buffer = 0
		code = H
	"\"!!"
	itemGiveChip
		chip = 199
		code = H
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9802
	end
}
script 101 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 227
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 227
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9803
	end
}
script 102 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 230
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 230
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9804
	end
}
script 103 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 233
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 233
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9805
	end
}
script 104 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 236
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 236
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9806
	end
}
script 105 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 239
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 239
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9807
	end
}
script 106 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 242
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 242
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9808
	end
}
script 107 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 245
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 245
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9809
	end
}
script 108 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 248
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 248
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9810
	end
}
script 109 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 251
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 251
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9811
	end
}
script 110 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 254
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 254
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9812
	end
}
script 111 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 257
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 257
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9813
	end
}
script 112 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printChip
		buffer = 0
		chip = 260
	" "
	printCode
		buffer = 0
		code = *
	"\"!!"
	itemGiveChip
		chip = 260
		code = *
		amount = 1
	playerFinish
	playerResetScene
	keyWait
		any = false
	flagSet
		flag = 9814
	end
}
script 113 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printItem
		buffer = 0
		item = 83
	"\"!!"
	itemGive
		item = 83
		amount = 1
	keyWait
		any = false
	clearMsg
	"""
	In NaviCust you can
	now use L Button or
	R Button to spin red
	"""
	keyWait
		any = false
	clearMsg
	"program parts."
	keyWait
		any = false
	playerFinish
	playerResetScene
	flagSet
		flag = 9815
	end
}
script 114 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printItem
		buffer = 0
		item = 81
	"\"!!"
	itemGive
		item = 81
		amount = 1
	keyWait
		any = false
	clearMsg
	"""
	In NaviCust you can
	now use L Button or
	R Button to spin
	"""
	keyWait
		any = false
	clearMsg
	"""
	yellow program
	parts.
	"""
	keyWait
		any = false
	playerFinish
	playerResetScene
	flagSet
		flag = 9816
	end
}
script 115 mmbn6 {
	msgOpenQuick
	playerAnimateScene
		animation = 24
	"""
	Lan got:
	"
	"""
	printItem
		buffer = 0
		item = 85
	"\"!!"
	itemGive
		item = 85
		amount = 1
	keyWait
		any = false
	clearMsg
	"""
	In NaviCust you can
	now use L Button or
	R Button to spin
	"""
	keyWait
		any = false
	clearMsg
	"green program parts."
	keyWait
		any = false
	playerFinish
	playerResetScene
	flagSet
		flag = 9817
	end
}
