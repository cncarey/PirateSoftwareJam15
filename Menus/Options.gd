class_name Options_Menu
extends MarginContainer

@onready var return_button = $VBoxContainer/ReturnContainer/Button

#sound buses
@onready var master_bus :int = AudioServer.get_bus_index("Master")
@onready var music_bus :int = AudioServer.get_bus_index("Music")
@onready var sfx_bus :int = AudioServer.get_bus_index("SFx")


@onready var master_slider = %MasterSlider
@onready var music_slider = %MusicSlider
@onready var s_fx_slider = %SFxSlider

signal returnButton()

# Called when the node enters the scene tree for the first time.
func _ready():
	var curMaster : int= AudioServer.get_bus_volume_db(master_bus)
	if curMaster != null:
		master_slider.value = curMaster
		pass
	
	var curMusic : int= AudioServer.get_bus_volume_db(music_bus)
	if curMusic != null:
		music_slider.value = curMusic
		pass
		
	var curSfx : int= AudioServer.get_bus_volume_db(sfx_bus)
	if curSfx != null:
		s_fx_slider.value = curSfx
		pass
		
	#Global.showTutorial
	pass # Replace with function body.


func masterVolumeChanged(value: float):
	SoundManager.playSound("menu")
	AudioServer.set_bus_volume_db(master_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)
	pass
	
func musicVolumeChanged(value: float):
	SoundManager.playSound("menu")
	AudioServer.set_bus_volume_db(music_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(music_bus, true)
	else:
		AudioServer.set_bus_mute(music_bus, false)
	pass
	
func sfxVolumeChanged(value: float):
	SoundManager.playSound("menu")
	AudioServer.set_bus_volume_db(sfx_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(sfx_bus, true)
	else:
		AudioServer.set_bus_mute(sfx_bus, false)
	pass

func grabReturnFocus():
	return_button.grab_focus()

func return_pressed():
	returnButton.emit()


func onHover():
	SoundManager.playSound("menu")
	pass # Replace with function body.
