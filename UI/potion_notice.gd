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

var notice = null
var quest = {}
signal acceptedNotice()
# Called when the node enters the scene tree for the first time.
func _ready():
	payout.text = str(quest["coins"])	
	due_date.text = "Due in "+str(quest["days"])+" days"
	
	#show the reqs potions
	if quest.has(0):
		purple_container.show()
		purple_count.text = str(quest[0])
	if quest.has(1):
		blue_container.show()
		blue_count.text = str(quest[1])
	if quest.has(2):
		orange_container.show()
		orange_count.text = str(quest[2])
	if quest.has(3):
		green_container.show()
		green_count.text = str(quest[3])
	if quest.has(4):
		pink_container.show()
		pink_count.text = str(quest[4])
	
	#TODO generate random names for the different potions
	#TODO determine if we need special items	
	
	#check if you have the replace upgrade

func acceptQuest():
	#push the requiredIngrediants and remove the items in the board
	if QuestManager.addQuest(quest):
		SoundManager.playSound("paper")
		acceptedNotice.emit()
		queue_free()
	else:
		SoundManager.playSound("error")
	pass
	
func closeQuest():
	SoundManager.playSound("menu")
	queue_free()
	pass
	
func replaceQuest():
	pass
