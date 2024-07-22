extends Control

@onready var coin_count = %CoinCount
@onready var move_count = %MoveCount
@onready var day_count = %DayCount


# Called when the node enters the scene tree for the first time.
func _ready():
	updateCoins(Global.coins)
	updateCurMove(QuestManager.curTurn)
	updateDays(QuestManager.curDay)
	
	Global.coins_changed.connect(updateCoins)
	QuestManager.curTurn_changed.connect(updateCurMove)
	QuestManager.maxTurn_changed.connect(updateMaxTurns)
	QuestManager.curDay_changed.connect(updateDays)
	pass # Replace with function body.

func updateCoins(count: int):
	coin_count.text = str(count)

func updateCurMove(curMove: int):
	move_count.text = str(curMove) + "/" + str(QuestManager.maxTurn)

func updateMaxTurns(MaxTurn: int):
	move_count.text = str(QuestManager.curTurn) + "/" + str(MaxTurn)

func updateDays(count: int):
	day_count.text = str(count)
