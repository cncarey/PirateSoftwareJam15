extends MarginContainer

@onready var display_name = %DisplayName
@onready var cost = %Cost

var upgrade = {}
signal onShopItemSelected(s, u)

# Called when the node enters the scene tree for the first time.
func _ready():
	updateUpgrade()
	
func updateUpgrade():
	display_name.text = upgrade["DisplayName"]
	if upgrade["CurIncrease"] < upgrade["Cost"].size():
		cost.text = str(upgrade["Cost"][upgrade["CurIncrease"]])
	else:
		cost.text = "--"
	pass # Replace with function body.


func selectShopItem():
	onShopItemSelected.emit(self, upgrade)
	pass # Replace with function body.

func reset():
	pass
