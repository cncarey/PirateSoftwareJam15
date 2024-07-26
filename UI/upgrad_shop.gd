extends CanvasLayer

var shopItem = preload("res://UI/shop_item.tscn")
@onready var shop_item_container = $MarginContainer/ShopItemContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	for key in UpgradeManager.upgrades:
		var upgrade = UpgradeManager.upgrades[key]
		print(upgrade)
		var si = shopItem.instantiate()
		si.upgrade = upgrade
		shop_item_container.add_child(si)
		pass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
