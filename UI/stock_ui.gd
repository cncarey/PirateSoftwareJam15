extends MarginContainer

@onready var purple_count = %PurpleCount
@onready var blue_count = %BlueCount
@onready var orange_count = %OrangeCount
@onready var green_count = %GreenCount
@onready var pink_count = %PinkCount
@onready var eye_container = %EyeContainer
@onready var eye_count = %EyeCount
@onready var flower_container = %FlowerContainer
@onready var flower_count = %FlowerCount
@onready var mushroom_container = %MushroomContainer
@onready var mushroom_count = %MushroomCount


# Called when the node enters the scene tree for the first time.
func _ready():
	updatePurple(Global.purple)
	updateBlue(Global.blue)
	updateOrange(Global.orange)
	updateGreen(Global.green)
	updatePink(Global.pink)
	updateEyes(Global.eyes)
	updateFlowers(Global.flowers)
	updateMushrooms(Global.mushrooms)
	
	Global.purple_changed.connect(updatePurple)
	Global.blue_changed.connect(updateBlue)
	Global.orange_changed.connect(updateOrange)
	Global.green_changed.connect(updateGreen)
	Global.pink_changed.connect(updatePink)
	Global.eyes_changed.connect(updateEyes)
	Global.flowers_changed.connect(updateFlowers)
	Global.mushrooms_changed.connect(updateMushrooms)
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
	
func updateEyes(count: int):
	eye_count.text = str(count)
	if count <= 0:
		eye_container.hide()
	else:
		eye_container.show()
		
func updateFlowers(count: int):
	flower_count.text = str(count)
	if count <= 0:
		flower_container.hide()
	else:
		flower_container.show()

func updateMushrooms(count: int):
	mushroom_count.text = str(count)
	if count <= 0:
		mushroom_container.hide()
	else:
		mushroom_container.show()
