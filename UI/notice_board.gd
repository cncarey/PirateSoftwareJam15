extends MarginContainer

var noticeItem = preload("res://UI/notice_board_item.tscn")
var potionNotice = preload("res://UI/potion_notice.tscn")
@onready var grid_container = $MarginContainer/VBoxContainer/GridContainer

signal closeNoticeBoard()
signal noticeBoardSelected(s, q)
# Called when the node enters the scene tree for the first time.
func _ready():
	for q in QuestManager.todaysQuests:
		var ni = noticeItem.instantiate()
		ni.sealPosition = q["sealPosition"]
		ni.sealColor = q["sealColor"]
		ni.quest = q
		
		grid_container.add_child(ni)
		if q.has("accepted"):
			ni.modulate = Color(1,1,1,0)
		else:
			ni.connect("selectedItem", selectedItem)
		
	pass # Replace with function body.

func resetBoard():
	pass
	
func onClose():
	closeNoticeBoard.emit()
	queue_free()
	pass

func acceptedNotice():
	print(currentOpenNotice)
	pass

func closeNotice():
	currentOpenNotice = null
	pass

var currentOpenNotice = null
func selectedItem(selected, q):
	if q.has("accepted"): return
	
	currentOpenNotice = selected
	q["accepted"] = true
	noticeBoardSelected.emit(selected, q)
	pass
