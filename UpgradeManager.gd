extends Node

var upgrades = {
	#imp
	"MoreTurns":{
		"DisplayName" : "More Turns Per Day",
		"Description": "Get 3 more turns each day",
		"MaxIncrease": 3,
		"CurIncrease" : 0,
		"Cost" : [250, 450, 600]
	},
	#imp
	"MoreQuests":{
		"DisplayName" : "More Backlog Quests",
		"Description": "Take one more quests at a time",
		"MaxIncrease": 3,
		"CurIncrease" : 0,
		"Cost" : [100, 250, 450]
	},
	#imp
	"RefillQuests":{
		"DisplayName" : "Refill the Quest Board",
		"Description": "Refill the Quest Board one time per day",
		"MaxIncrease": 1,
		"CurIncrease" : 0,
		"Cost" : [600]
	},
	"AddRow":{
		"DisplayName" : "Add Shop Row",
		"Description": "Add one more row to the shop floor",
		"MaxIncrease": 3,
		"CurIncrease" : 0,
		"Cost" : [250, 450, 600]
	},
	"FreeRestock":{
		"DisplayName" : "Free Shop Restock",
		"Description": "Refill the Shop without loosing the day. Loose one turn instead.",
		"MaxIncrease": 1,
		"CurIncrease" : 0,
		"Cost" : [600]
	},
	"BlackCat":{
		"DisplayName" : "Black Cat",
		"Description": "You cat will ring the bell when the investigator shows up",
		"MaxIncrease": 1,
		"CurIncrease" : 0,
		"Cost" : [250]
	},
	#imp
	"NoTurnFront":{
		"DisplayName" : "Free Fronts",
		"Description": " Activate the front without loosing a turn",
		"MaxIncrease": 1,
		"CurIncrease" : 0,
		"Cost" : [350]
	},
	#imp
	"LessInvestigators":{
		"DisplayName" : "Less Investigators",
		"Description": "Lower your rate of suspission so the investigators come less",
		"MaxIncrease": 2,
		"CurIncrease" : 0,
		"Cost" : [600]
	},
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func resetGame():
	for key in upgrades:
		var upgrade = upgrades[key]
		upgrade["CurIncrease"] = 0
	pass

func tryUpgrade(u):
	if u["CurIncrease"] < u["MaxIncrease"]:
		if Global.tryTakeCoins(u["Cost"][u["CurIncrease"]]):
			u["CurIncrease"] += 1
			pass
	pass
