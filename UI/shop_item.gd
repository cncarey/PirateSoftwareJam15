extends MarginContainer

@onready var display_name = %DisplayName
@onready var cost = %Cost

var upgrade = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	print(upgrade)
	display_name.text = upgrade["DisplayName"]
	if upgrade["CurIncrease"] < upgrade["Cost"].size():
		cost.text = str(upgrade["Cost"][upgrade["CurIncrease"]])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
