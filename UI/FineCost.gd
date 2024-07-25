extends Label

@onready var fine_cost = %FineCost
@onready var caught = %caught

# Called when the node enters the scene tree for the first time.
func _ready():
	var coins = 0
	fine_cost.text = str(coins)
	
	#if we don't have enough coins throw game over
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
