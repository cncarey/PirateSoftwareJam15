extends CanvasLayer

var shopItem = preload("res://UI/shop_item.tscn")

@onready var shop_item_container = %ShopItemContainer
@onready var upgrade_title = %UpgradeTitle
@onready var upgrade_description = %UpgradeDescription

# Called when the node enters the scene tree for the first time.
func _ready():
	for key in UpgradeManager.upgrades:
		var upgrade = UpgradeManager.upgrades[key]
		
		var si = shopItem.instantiate()
		si.upgrade = upgrade
		shop_item_container.add_child(si)
		si.connect("onShopItemSelected", updateSelected)
		pass
	pass # Replace with function body.

func updateSelected(_shopItem, upgrade):
	print(upgrade)
	upgrade_title.text = upgrade["DisplayName"]
	upgrade_description.text = upgrade["Description"]
	
