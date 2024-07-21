extends MarginContainer

var noticeItem = preload("res://UI/notice_board_item.tscn")
var potionNotice = preload("res://UI/potion_notice.tscn")
@onready var grid_container = $MarginContainer/VBoxContainer/GridContainer

signal  closeNoticeBoard()
# Called when the node enters the scene tree for the first time.
func _ready():
	for q in QuestManager.todaysQuests:
		var ni = noticeItem.instantiate()
		ni.sealPosition = q["sealPosition"]
		ni.sealColor = q["sealColor"]
		ni.quest = q
		
		grid_container.add_child(ni)
		ni.connect("selectedItem", selectedItem)
		
	pass # Replace with function body.

func resetBoard():
	pass
	
func onClose():
	closeNoticeBoard.emit()
	queue_free()
	pass

func selectedItem(q):
	print(q)
	pass
