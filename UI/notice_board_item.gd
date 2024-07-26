extends MarginContainer
@onready var message_container = %messageContainer
@onready var seal = %Seal

@export var redSeal : Texture
@export var greenSeal : Texture
@export var yellowSeal : Texture

@export var quest = {}
@export var sealPosition: int = 0
@export var sealColor: int = 0

signal selectedItem(s, q)
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("focus_entered", onPressed)
	match(sealPosition):
		0:
			message_container.size_flags_horizontal = SIZE_SHRINK_BEGIN
		1:
			message_container.size_flags_horizontal = SIZE_SHRINK_CENTER
		2:
			message_container.size_flags_horizontal = SIZE_SHRINK_END
	
	match(sealColor):
		0:
			seal.texture = redSeal
		1:
			seal.texture = greenSeal
		2:
			seal.texture = yellowSeal
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func onPressed():
	selectedItem.emit(self, quest)
	pass
