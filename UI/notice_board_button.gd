extends TextureButton

signal OpenNoticeBoard()
var isOpen = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func noticeBoardStartHover():
	modulate = Color(1,1,1,.5)
	pass # Replace with function body.
	
func noticeBoardStopHover():
	modulate = Color(1,1,1,1)
	pass # Replace with function body.

func _on_pressed():
	disabled = true
	OpenNoticeBoard.emit()
	pass # Replace with function body.

func closeNoticeBoard():
	SoundManager.playSound("menu")
	disabled = false
