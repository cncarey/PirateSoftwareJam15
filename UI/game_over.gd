extends MarginContainer

@onready var title = %Title
@onready var message = %Message
@onready var close_button = %CloseButton


var won = false
var winningEndings = ["You made enough coins to go back to potion schoool next semester."]
var loosingEndings = ["You didn't make enough coins to go back to potion school next semester."]
# Called when the node enters the scene tree for the first time.
func _ready():
	if won:
		var winIndex = randi_range(0, winningEndings.size() - 1)
		title.text = "Congratulations!"
		message.text = winningEndings[winIndex]
	else:
		var looseIndex = randi_range(0, loosingEndings.size() - 1)
		title.text = "I'm Sorry To Inform You"
		message.text = loosingEndings[looseIndex]
	pass # Replace with function body.


func onCloseButton():
	await LevelTransition.fadeToBlack()
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
	LevelTransition.fadeFromBlack()
