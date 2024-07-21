extends MarginContainer
@onready var purple_container = $MarginContainer/VBoxContainer/RequiresContainer/PurpleContainer
@onready var purple_count = $MarginContainer/VBoxContainer/RequiresContainer/PurpleContainer/PurpleCount
@onready var blue_container = $MarginContainer/VBoxContainer/RequiresContainer/BlueContainer
@onready var blue_count = $MarginContainer/VBoxContainer/RequiresContainer/BlueContainer/BlueCount
@onready var orange_container = $MarginContainer/VBoxContainer/RequiresContainer/OrangeContainer
@onready var orange_count = $MarginContainer/VBoxContainer/RequiresContainer/OrangeContainer/OrangeCount
@onready var green_container = $MarginContainer/VBoxContainer/RequiresContainer/GreenContainer
@onready var green_count = $MarginContainer/VBoxContainer/RequiresContainer/GreenContainer/GreenCount
@onready var pink_container = $MarginContainer/VBoxContainer/RequiresContainer/PinkContainer
@onready var pink_count = $MarginContainer/VBoxContainer/RequiresContainer/PinkContainer/PinkCount
@onready var due_date = $MarginContainer/VBoxContainer/DueDate
@onready var payout = %Payout

var quest = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	#determine how many potions will be required
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
		
	payout.text = str(quest["coins"])	
	quest["days"] =  randi_range(2,10)
	due_date.text = "Due in "+str(quest["days"])+" days"
	
	#show the reqs potions
	for i in requiredPotions:
		#decide how many of each potion is needed and update the GUI
		if i != null:
			quest[i] = randi_range(2,10)
			match i:
				0:
					purple_container.show()
					purple_count.text = str(quest[i])
				1:
					blue_container.show()
					blue_count.text = str(quest[i])
				2:
					orange_container.show()
					orange_count.text = str(quest[i])
				3:
					green_container.show()
					green_count.text = str(quest[i])
				4:
					pink_container.show()
					pink_count.text = str(quest[i])
		pass
	#TODO generate random names for the different potions
	#TODO determine if we need special items	
	print(quest)
	#check if you have the replace upgrade

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

func acceptQuest():
	#push the requiredIngrediants and remove the items in the board
	if QuestManager.addQuest(quest):
		queue_free()
	pass
	
func closeQuest():
	self.hide()
	pass
	
func replaceQuest():
	pass
