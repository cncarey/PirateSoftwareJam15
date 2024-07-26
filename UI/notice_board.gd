extends MarginContainer

var noticeItem = preload("res://UI/notice_board_item.tscn")

@onready var grid_container = %GridContainer
@onready var reset_btn = %ResetBtn


signal closeNoticeBoard()
signal noticeBoardSelected(s, q)
# Called when the node enters the scene tree for the first time.
func _ready():
	var upgrade = UpgradeManager.upgrades["RefillQuests"]
	var RefillQuests = upgrade["CurIncrease"]
		
	if RefillQuests >= 1 && !QuestManager.RefillQuestsFilledToday:
		reset_btn.show()
		reset_btn.disabled = false
		
	setBoard()
	pass
	
func setBoard():
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
	var upgrade = UpgradeManager.upgrades["RefillQuests"]
	var RefillQuests = upgrade["CurIncrease"]
	
	if RefillQuests >= 1 && !QuestManager.RefillQuestsFilledToday:
		QuestManager.RefillQuestsFilledToday = true
		reset_btn.hide()
		reset_btn.disabled = true
		
		QuestManager.addQuestsToBoard()
		for gc in grid_container.get_children():
			grid_container.remove_child(gc)
			gc.queue_free()
		setBoard()
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
	noticeBoardSelected.emit(selected, q)
	pass
