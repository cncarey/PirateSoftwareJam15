extends Control

@onready var coin_count = %CoinCount
@onready var move_count = %MoveCount

# Called when the node enters the scene tree for the first time.
func _ready():
	updateCoins(Global.coins)
	updateCurMove(QuestManager.curTurn)
	
	Global.coins_changed.connect(updateCoins)
	QuestManager.curTurn_changed.connect(updateCurMove)
	QuestManager.maxTurn_changed.connect(updateMaxTurns)
	pass # Replace with function body.

func updateCoins(count: int):
	coin_count.text = str(count)

func updateCurMove(curMove: int):
	move_count.text = str(curMove) + "/" + str(QuestManager.maxTurn)

func updateMaxTurns(MaxTurn: int):
	move_count.text = str(QuestManager.curTurn) + "/" + str(MaxTurn)
