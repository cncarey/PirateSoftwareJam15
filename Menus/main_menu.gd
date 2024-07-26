extends Control
@onready var options_container = $OptionsContainer
@onready var main_container = $MainContainer/MainContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_start_pressed():
	#Global.resetGame()
	#TODO go to the opening cut scene
	get_tree().change_scene_to_file("res://Scenes/OpeningScene.tscn")
	pass # Replace with function body.


func hideOptions():
	main_container.show()
	options_container.hide()
	pass
	
func showOptions():
	main_container.hide()
	options_container.show()
	pass

func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
