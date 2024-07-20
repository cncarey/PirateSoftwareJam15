extends Control

@onready var coin_count = %CoinCount

# Called when the node enters the scene tree for the first time.
func _ready():
	updateCoins(Global.coins)
	
	Global.coins_changed.connect(updateCoins)
	pass # Replace with function body.

func updateCoins(count: int):
	coin_count.text = str(count)
