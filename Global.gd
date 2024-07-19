extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

@export var coins = 0:
	set(value):
		coins = maxi(0, value)
		coins_changed.emit(coins)
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
		
signal coins_changed(coins)
signal purple_changed(p)
signal blue_changed(b)
signal orange_changed(o)
signal green_changed(g)
signal pink_changed(p)
