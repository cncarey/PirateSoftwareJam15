extends Node2D
enum potionTypes {purple, blue, orange, green, pink}
@onready var sprite_2d = $Sprite2D

@export var curPotionType: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	curPotionType = randi_range(0, 4)
	sprite_2d.frame = curPotionType
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
