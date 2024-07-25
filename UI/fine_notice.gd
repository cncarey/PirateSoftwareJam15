extends MarginContainer
@onready var fine_cost = %FineCost
@onready var caught = %caught


# Called when the node enters the scene tree for the first time.
func _ready():
	var coins = 0
	if Global.coins > 2000:
		coins = randi_range(120, 175)
	elif Global.coins > 1500:
		coins = randi_range(100, 150)
	elif Global.coins > 700:
		coins = randi_range(30, 75)
	elif Global.coins > 150:
		coins = randi_range(20, 50)
	else:
		if QuestManager.curDay <= 8:
			coins = 0
			caught.text ="You got CAUGHT!
		This is a warning!"
		else:
			coins = randi_range(20, 50)
		
	if coins > 0:
		fine_cost.text = str(coins)
		if Global.tryTakeCoins(coins):
			pass
		else:
			Global.gameOver.emit()
		
	pass # Replace with function body.

func disappear():
	queue_free()
	pass # Replace with function body.
