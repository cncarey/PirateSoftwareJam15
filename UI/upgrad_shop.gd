class_name UpgradeShop
extends CanvasLayer

var shopItem = preload("res://UI/shop_item.tscn")

@onready var animation_player = $AnimationPlayer

@onready var shop_container = $ShopContainer
@onready var shop_item_container = %ShopItemContainer
@onready var upgrade_title = %UpgradeTitle
@onready var upgrade_description = %UpgradeDescription
@onready var cost = %Cost
@onready var purchase_button = %PurchaseButton

signal ShopClosed()

var curUpgrade = null
var curShopItem = null
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("RESET")
	Global.coins_changed.connect(coinsChanged)
	for key in UpgradeManager.upgrades:
		var upgrade = UpgradeManager.upgrades[key]
		
		var si = shopItem.instantiate()
		si.upgrade = upgrade
		shop_item_container.add_child(si)
		
		si.connect("onShopItemSelected", updateSelected)
		pass
	pass # Replace with function body.

func updateSelected(_shopItem, upgrade, playSound = true):
	if playSound:
		SoundManager.playSound("menu")
	curShopItem = _shopItem
	curUpgrade = upgrade
	upgrade_title.text = upgrade["DisplayName"]
	upgrade_description.text = upgrade["Description"]
	var costs = upgrade["Cost"]
	if costs.size() <= upgrade["CurIncrease"]:
		cost.text = "--"
		purchase_button.disabled = true
		purchase_button.hide()
	else:
		var curCost = costs[upgrade["CurIncrease"]]
		cost.text = str(curCost)
		purchase_button.show()
		#check if the player has enough money
		isPurchasable(Global.coins, curCost)

func coinsChanged(glbCoins):
	if curUpgrade != null:
		var costs = curUpgrade["Cost"]
		if curUpgrade["CurIncrease"] >= costs.size():
			purchase_button.disabled = true
			purchase_button.hide()
		else:
			purchase_button.show()	
			var curCost = costs[curUpgrade["CurIncrease"]]
			isPurchasable(glbCoins, curCost)

func isPurchasable(glbCoins, upgradCost):
	purchase_button.disabled = false
	if glbCoins >= upgradCost:
		purchase_button.modulate = Color(1,1,1,1)
	else:
		purchase_button.modulate = Color(1,1,1,.5)
	
func purchaseUpgrade():
	if curUpgrade == null: 
		SoundManager.playSound("error")
		return
		
	var costs = curUpgrade["Cost"]
	if costs.size() > curUpgrade["CurIncrease"]:
		var curCost = costs[curUpgrade["CurIncrease"]]
		if Global.tryTakeCoins(curCost):
			SoundManager.playSound("coins")
			curUpgrade["CurIncrease"] += 1
			updateSelected(curShopItem, curUpgrade, false)
			curShopItem.updateUpgrade()
		else:
			SoundManager.playSound("error")

func onOpen():
	SoundManager.playSound("menu")
	Global.shopOpen = true
	if shop_container.scale.x != 1:
		animation_player.play("SlideOut")

func onClose():
	SoundManager.playSound("menu")
	Global.shopOpen = false
	animation_player.play("SlideIn")
	ShopClosed.emit()
