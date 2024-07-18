extends Node2D

@onready var sprite_2d = $Sprite2D

@export var curbg: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	curbg = randi_range(16,30)
	if curbg < 21:
		sprite_2d.frame = curbg 
	else:
		sprite_2d.frame = 21
		
	print(str(curbg))
	print(str(sprite_2d.frame))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
