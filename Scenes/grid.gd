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

var startTouch = Vector2(0,0)
var endTouch = Vector2(0,0)
var isMoving = true

# Called when the node enters the scene tree for the first time.
func _ready():
	potions = instBoard()
	spawnPotions()
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
			var loops = 0
			while (checkForMatch(w, h, p.curPotionType) && loops < 100):
				p.newPotionType()
				loops += 1
			bg.global_position = gridToPixel(w, h)
			p.global_position = gridToPixel(w, h)
			p.z_index = 100
			potions[w][h] = p

func checkForMatch( column: int, row: int, potionType: int) -> bool:
	var left = column - 1
	var right = column - 2
	var up = row - 1
	var down = row - 2
	
	if column > 1:
		if potions[left][row] != null && potions[right][row] != null:
			if potions[left][row].curPotionType == potionType && potions[right][row].curPotionType == potionType:
				return true
	if row > 1:
		if potions[column][up]!= null && potions[column][down] != null:
			if potions[column][up].curPotionType == potionType && potions[column][down].curPotionType == potionType:
				return true
				
	return false

func gridToPixel(column: int, row: int) -> Vector2:
	var newX = xStart + xOffset * column
	var newY = yStart + -yOffeset * row
	return Vector2(newX, newY)
		
func pixelToGrid(x, y) -> Vector2:
	var newX = round((x-xStart)/ xOffset)
	var newY = round((y-yStart)/ -yOffeset)
	return Vector2(newX, newY)

func isInGrid(column: int, row: int) -> bool:
	return column >= 0 && column < width && row >= 0 && row < height
	
func isTouched():
	if Input.is_action_just_pressed("ui_touch"):
		var checkGridPosition = get_global_mouse_position()
		var gridPosition = pixelToGrid(checkGridPosition.x, checkGridPosition.y)
		if isInGrid(gridPosition.x, gridPosition.y):
			isMoving = true
			startTouch = get_global_mouse_position()
		else:
			isMoving = false
		
	if Input.is_action_just_released("ui_touch"):
		var checkGridPosition = get_global_mouse_position()
		var gridPosition = pixelToGrid(checkGridPosition.x, checkGridPosition.y)
		if isInGrid(gridPosition.x, gridPosition.y) && isMoving:
			isMoving = false
			translateMove(pixelToGrid(startTouch.x, startTouch.y), gridPosition)
			endTouch = get_global_mouse_position()
			
func swapPotions(column: int, row: int, direction: Vector2):
	var newX = column + direction.x
	var newY = row + direction.y
	
	var startPotion = potions[column][row]
	var endPotion = potions[newX][newY]
	if startPotion == null || endPotion == null : return
	
	potions[column][row] = endPotion
	potions[newX][newY] = startPotion
	
	startPotion.move(gridToPixel(newX, newY))
	endPotion.move(gridToPixel(column, row))
	findMatches()
	pass

func translateMove(start: Vector2, end: Vector2):
	var diff = end - start
	
	if abs(diff.x)> abs(diff.y):
		if diff.x > 0:
			swapPotions(start.x, start.y, Vector2(1,0))
		elif diff.x < 0:
			swapPotions(start.x, start.y, Vector2(-1,0))
	else:
		if diff.y > 0:
			swapPotions(start.x, start.y, Vector2(0,1))
		elif diff.y < 0:
			swapPotions(start.x, start.y, Vector2(0,-1))	

func _process(delta):
	isTouched()
	
func findMatches():
	for w in width:
		for h in height:
			if potions[w][h] != null:
				var curPotionType = potions[w][h].curPotionType
				if w > 0 && w < width - 1:
					var left = w - 1
					var right = w + 1
					if potions[left][h] != null && potions[right][h] != null:
						if potions[left][h].curPotionType == curPotionType && potions[right][h].curPotionType == curPotionType:
							potions[left][h].onMatch()
							potions[w][h].onMatch()
							potions[right][h].onMatch()
				if h > 0 && h < height - 1:
					var up = h - 1
					var down = h + 1
					if potions[w][up] != null && potions[w][down] != null:
						if potions[w][up].curPotionType == curPotionType && potions[w][down].curPotionType == curPotionType:
							potions[w][up].onMatch()
							potions[w][h].onMatch()
							potions[w][down].onMatch()
							
	await get_tree().create_timer(.3).timeout
	destroyMatched()

func destroyMatched():
	for w in width:
		for h in height:
			if potions[w][h] != null:
				if potions[w][h].hasMatch:
					potions[w][h].queue_free()
					potions[w][h] = null
							
	await get_tree().create_timer(.3).timeout
	collapseColumns()

func collapseColumns():
	for w in width:
		for h in height:
			if potions[w][h] == null:
				for k in range(h + 1, height):
					if potions[w][k] != null:
						potions[w][k].move(gridToPixel(w, h))
						potions[w][h] = potions[w][k]
						potions[w][k] = null
						break
