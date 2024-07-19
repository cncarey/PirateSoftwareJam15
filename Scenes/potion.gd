class_name potion
extends Node2D
enum potionTypes {purple, blue, orange, green, pink}
@onready var sprite_2d = $Sprite2D

@export var curPotionType: int = 0

var hasMatch = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	newPotionType()
	
func newPotionType():
	curPotionType = randi_range(0, 4)
	sprite_2d.frame = curPotionType
	pass # Replace with function body.

func move(target: Vector2):
	var tween = create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position", target, .3).from_current()
	
func onMatch():
	sprite_2d.modulate = Color(1,1,1,.5)
	#update my corresponding inventory item
	pass
