extends Control
@onready var options_container = $OptionsContainer
@onready var main_container = $MainContainer/MainContainer
@onready var how_to_play_container = $HowToPlayContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func onHover():
	SoundManager.playSound("menu")

func _on_start_pressed():
	SoundManager.playSound("menu")
	Global.resetGame()
	UpgradeManager.resetGame()
	QuestManager.resetGame()
	await LevelTransition.fadeToBlack()
	get_tree().change_scene_to_file("res://Scenes/OpeningScene.tscn")
	LevelTransition.fadeFromBlack()


func hideOptions():
	SoundManager.playSound("menu")
	main_container.show()
	options_container.hide()
	pass
	
func showOptions():
	SoundManager.playSound("menu")
	main_container.hide()
	options_container.show()
	pass

func hideHowToPlay():
	main_container.show()
	SoundManager.playSound("menu")
	how_to_play_container.hide()
	pass
func showHowToPlay():
	SoundManager.playSound("menu")
	main_container.hide()
	how_to_play_container.show()
	pass

func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
