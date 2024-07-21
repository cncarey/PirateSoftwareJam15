extends Node

var quests : Array = []
var todaysQuests : Array = []
@export var questMaxCount = 2 : 
	set(value):
		questMaxCount = maxi(2, value)
		questMaxCount_changed.emit(questMaxCount)
	get:
		return questMaxCount	
@export var maxBoardCount = 4 : 
	set(value):
		maxBoardCount = maxi(4, value)
		maxBoardCount_changed.emit(maxBoardCount)
	get:
		return maxBoardCount

signal questMaxCount_changed(q)
signal maxBoardCount_changed(b)
signal quests_changed(q)
signal QuestAccepted()
signal QuestClosed()
signal QuestReplaced()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func addQuest(q) -> bool:
	if canAddQuest():
		quests.append(q)
		QuestAccepted.emit()
		print(quests)
		return true
	else:
		return false
	pass
	
func canAddQuest():
	return quests.size() < questMaxCount
	
func completeQuest(q):
	#add to the players coins
	removeQuest(q)
	pass
	
func removeQuest(q):
	quests.erase(q)
	pass
	
func updateQuestDays():
	for i in quests:
		if i != null:
			if i.has("curDay"):
				i["curDay"] += 1
			else :
				i["curDay"] = 1
	var to_remove = quests.filter(filterLate)
	for j in to_remove:
		removeQuest(j)
		
func filterLate(q):
	if "curDay" in q && "days" in q:
		return q["curDay"] > q["days"]
	else:
		return false

func setTodaysQuests():
	todaysQuests = []
	
	for x in range(maxBoardCount):
		var quest = {}
		var requiredPotions: Array = []
		if Global.coins > 3000:
			requiredPotions = pick_rand_number(range(5), randi_range(2,4))
			quest["coins"]= calcCost(requiredPotions, 70)
		elif Global.coins > 1500:
			requiredPotions = pick_rand_number(range(5), randi_range(1,4))
			quest["coins"]= calcCost(requiredPotions, 65)
		elif Global.coins > 1000:
			requiredPotions = pick_rand_number(range(5), randi_range(1,3))
			quest["coins"]= calcCost(requiredPotions, 50)
		elif Global.coins > 500:
			requiredPotions = pick_rand_number(range(5), randi_range(1,2))
			quest["coins"]= calcCost(requiredPotions, 35)
		else:
			requiredPotions = pick_rand_number(range(5), 1)
			quest["coins"]= calcCost(requiredPotions, 25)
		
		quest["days"] =  randi_range(2,10)
		quest["sealPosition"] = randi_range(0, 2)
		quest["sealColor"] = randi_range(0, 2)
		#show the reqs potions
		for i in requiredPotions:
			#decide how many of each potion is needed and update the GUI
			if i != null:
				quest[i] = randi_range(2,10)
				
			pass
		#TODO generate random names for the different potions
		#TODO determine if we need special items	
		todaysQuests.append(quest)
		
	print(todaysQuests)

func calcCost(ingrediants: Array, price: int):
	return ingrediants.size() * price
	pass

func pick_rand_number(list: Array, amount: int) -> Array:
	randomize()
	list.shuffle()
	var new_list: Array = []

	assert(amount <= list.size(), "The number cannot be greater than the size of the Array")

	for i in range(amount):
		if new_list.size() <= amount:
			new_list.append(list[i])
	return new_list
	
