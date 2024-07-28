extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
const TUITIONCOST = 2500

@export var shopOpen = false:
	set(value):
		shopOpen = value
		shopOpen_changed.emit(shopOpen)
	get:
		return shopOpen

@export var coins = 0:
	set(value):
		coins = maxi(0, value)
		coins_changed.emit(coins)
		if coins >= TUITIONCOST:
			gameWon.emit()
	get:
		return coins
func tryTakeCoins(dec: int) -> bool:
	if coins - dec < 0:
		return false
	else:
		coins -= dec
		return true
#purple
@export var purple = 0 : 
	set(value):
		purple = maxi(0, value)
		purple_changed.emit(purple)
	get:
		return purple
func tryTakePurple(dec: int) -> bool:
	if purple - dec < 0:
		return false
	else:
		purple -= dec
		return true
	
#blue
@export var blue = 0 : 
	set(value):
		blue = maxi(0, value)
		blue_changed.emit(blue)
	get:
		return blue	
func tryTakeBlue(dec: int) -> bool:
	if blue - dec < 0:
		return false
	else:
		blue -= dec
		return true

#orange
@export var orange = 0 : 
	set(value):
		orange = maxi(0, value)
		orange_changed.emit(orange)
	get:
		return orange
func tryTakeOrange(dec: int) -> bool:
	if orange - dec < 0:
		return false
	else:
		orange -= dec
		return true
		
#green
@export var green = 0 : 
	set(value):
		green = maxi(0, value)
		green_changed.emit(green)
	get:
		return green
func tryTakeGreen(dec: int) -> bool:
	if green - dec < 0:
		return false
	else:
		green -= dec
		return true

#pink
@export var pink = 0 : 
	set(value):
		pink = maxi(0, value)
		pink_changed.emit(pink)
	get:
		return pink
func tryTakePink(dec: int) -> bool:
	if pink - dec < 0:
		return false
	else:
		pink -= dec
		return true

@export var flowers = 0 : 
	set(value):
		flowers = maxi(0, value)
		flowers_changed.emit(flowers)
	get:
		return flowers
func tryTakeFlowers(dec: int) -> bool:
	if flowers - dec < 0:
		return false
	else:
		flowers -= dec
		return true

@export var eyes = 0 : 
	set(value):
		eyes = maxi(0, value)
		eyes_changed.emit(eyes)
	get:
		return eyes
func tryTakeEyes(dec: int) -> bool:
	if eyes - dec < 0:
		return false
	else:
		eyes -= dec
		return true
		
@export var mushrooms = 0 : 
	set(value):
		mushrooms = maxi(0, value)
		mushrooms_changed.emit(mushrooms)
	get:
		return mushrooms
func tryTakeMushrooms(dec: int) -> bool:
	if mushrooms - dec < 0:
		return false
	else:
		mushrooms -= dec
		return true
		
signal shopOpen_changed(o)
		
signal coins_changed(coins)
signal purple_changed(p)
signal blue_changed(b)
signal orange_changed(o)
signal green_changed(g)
signal pink_changed(p)
signal flowers_changed(f)
signal eyes_changed(e)
signal mushrooms_changed(m)

signal gameOver()
signal gameWon()
