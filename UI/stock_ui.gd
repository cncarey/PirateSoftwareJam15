extends Control

@onready var purple_count = %PurpleCount
@onready var blue_count = %BlueCount
@onready var orange_count = %OrangeCount
@onready var green_count = %GreenCount
@onready var pink_count = %PinkCount


# Called when the node enters the scene tree for the first time.
func _ready():
	updatePurple(Global.purple)
	updateBlue(Global.blue)
	updateOrange(Global.orange)
	updateGreen(Global.green)
	updatePink(Global.pink)
	
	Global.purple_changed.connect(updatePurple)
	Global.blue_changed.connect(updateBlue)
	Global.orange_changed.connect(updateOrange)
	Global.green_changed.connect(updateGreen)
	Global.pink_changed.connect(updatePink)
	pass # Replace with function body.

func updatePurple(count: int):
	purple_count.text = str(count)
	
func updateBlue(count: int):
	blue_count.text = str(count)

func updateOrange(count: int):
	orange_count.text = str(count)

func updateGreen(count: int):
	green_count.text = str(count)
	
func updatePink(count: int):
	pink_count.text = str(count)
