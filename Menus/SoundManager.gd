extends Node2D

@onready var sound_player = $SoundPlayer
@onready var music_player = $MusicPlayer

var destroyFx = preload("res://Assets/Sounds/destroy.mp3")
var swapFx = preload("res://Assets/Sounds/movePiece.mp3")
var menuFX = preload("res://Assets/Sounds/menu.mp3")
var errorFx = preload("res://Assets/Sounds/error.mp3")
var crumplePaperFx = preload("res://Assets/Sounds/paperCrumple.mp3")
var coinsFx = preload("res://Assets/Sounds/purchase.mp3")
# Called when the node enters the scene tree for the first time.
func _ready():
	music_player.play()
	pass # Replace with function body.

func playSound(sound: String):
	match(sound):
		"destroy":
			sound_player.stream = destroyFx
		"coins":
			sound_player.stream = coinsFx
		"error":
			sound_player.stream = errorFx
		"menu":
			sound_player.stream = menuFX
		"paper":
			sound_player.stream = crumplePaperFx
		"swap":
			sound_player.stream = swapFx
			
			
	sound_player.play()
