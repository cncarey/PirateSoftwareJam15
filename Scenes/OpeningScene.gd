extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var skip_progress = %SkipProgress

@onready var curPress : float = 0.0: 
	set (value):
		curPress = value
		if curPress > 1.5:
			startGame()
			
		skip_progress.value = value
	get:
		return curPress

# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.playSound("paper")
	animation_player.play("OpenPage")
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		curPress += delta
	pass	
	
func _unhandled_input(event):
	if event.is_action_released("ui_accept"):
		curPress = 0

var startTriggered = false
func startGame():
	if !startTriggered:
		startTriggered = true
		await LevelTransition.fadeToBlack()
		await get_tree().create_timer(.3).timeout
		get_tree().change_scene_to_file("res://Scenes/MainShop.tscn")
		LevelTransition.fadeFromBlack()
	
	pass
