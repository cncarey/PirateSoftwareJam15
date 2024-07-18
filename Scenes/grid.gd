extends Node2D

@export var width: int
@export var height: int
@export  var xStart: int
@export var yStart: int
@export var xOffset: int
@export var yOffeset: int

var potion = preload("res://Scenes/potion.tscn")
var backGround = preload("res://Scenes/backgroundBlock.tscn")
var potions = []

# Called when the node enters the scene tree for the first time.
func _ready():
	potions = instBoard()
	spawnPotions()
	print(potions)
	pass # Replace with function body.

func instBoard():
	var array = []
	for w in width:
		array.append([])
		for h in height:
			array[w].append(null)

	return array

func spawnPotions():
	for w in width:
		for h in height:
			var p = potion.instantiate()
			var bg = backGround.instantiate()
			add_child(bg)
			add_child(p)
			bg.position = gridToPixel(w, h)
			p.position = gridToPixel(w, h)

func gridToPixel(column: int, row: int) -> Vector2:
	var newX = xStart + xOffset * column
	var newY = yStart + -yOffeset * row
	
	return Vector2(newX, newY)
	
	
func pixelToGrid(x, y):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
