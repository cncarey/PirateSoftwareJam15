extends Node2D

var isFrontEnabled = false
@onready var animation_player = $AnimationPlayer
@onready var shade = $Shade
@onready var timer = $Timer

signal finePlayer()

func _ready():
	Global.shopOpen_changed.connect(pauseInvestigator)

func startInvestigator():
	animation_player.play("investigator")
	pass # Replace with function body.

func onStringPulled():
	QuestManager.isFrontEnabled = !QuestManager.isFrontEnabled
	if QuestManager.isFrontEnabled:
		#pull down the shade
		shade.skew = 0
		#skew -> -89.9 lerp to 9 -> 9 to -5 -> -5 to 3 -> 3 to 0
		pass
	else:
		shade.skew = -89.9
		#put up the shade back
		pass # Replace with function body.

func sendFine():
	if QuestManager.isFrontEnabled:
		print("the investigator left")
		pass
	else:
		print("you didn't stop the investigator in time")
		finePlayer.emit()
	
func resetInvestigator():
	animation_player.play("RESET")
	
	#refactor so that if we haven't made a turn since the last investigator we
	#will restart it after the next turn is made
	#TODO get faster with the more coins that we have
	
	var upgrade = UpgradeManager.upgrades["LessInvestigators"]
	var extraTime = upgrade["CurIncrease"]
	var minSecs = 15 * (extraTime + 1)
	var maxSecs = 45 * (extraTime + 1)
	
	var timeBetween = randi_range(minSecs, maxSecs)
	timer.start(timeBetween)
	
var curAniPos = null	
var curTimerTime = null
func pauseInvestigator(isShopOpen: bool):
	if isShopOpen:
		if animation_player.is_playing():
			curAniPos = animation_player.current_animation_position
			curTimerTime = null
			animation_player.pause()
		elif timer.time_left > 0:
			curAniPos = null
			curTimerTime = timer.time_left
		else:
			curAniPos = null
			curTimerTime = 5
		timer.stop()
	else:
		if curAniPos != null:
			animation_player.play()
		elif curTimerTime != null:
			timer.start()
		else:
			timer.start(5)
		
		curAniPos = null
		curTimerTime = null
	pass
