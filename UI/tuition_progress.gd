extends MarginContainer
@onready var progress_bar = $VBoxContainer/ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	progress_bar.max_value = Global.TUITIONCOST
	updateCoins(Global.coins)
	Global.coins_changed.connect(updateCoins)

func updateCoins(count: int):
	progress_bar.value = count
