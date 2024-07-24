extends Node2D

var isFrontEnabled = false
@onready var animation_player = $AnimationPlayer
@onready var shade = $Shade
@onready var timer = $Timer

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
	
func resetInvestigator():
	animation_player.play("RESET")
	
	#refactor so that if we haven't made a turn since the last investigator we
	#will restart it after the next turn is made
	var timeBetween = randi_range(15, 45)
	timer.start(timeBetween)
	
