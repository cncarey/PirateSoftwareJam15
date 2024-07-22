extends Node2D
@onready var canvas_layer = $CanvasLayer
@onready var notice_board_button = $CanvasLayer/NoticeBoardButton
@onready var center_container = $CanvasLayer/CenterContainer


var noticeBoard = preload("res://UI/notice_board.tscn")
var potionNotice = preload("res://UI/potion_notice.tscn")

func _ready():
	QuestManager.setTodaysQuests()
	pass # Replace with function body.

func onDayEnd():
	QuestManager.setTodaysQuests()
	QuestManager.updateQuestDays()

func openNoticeBoard():
	#TODO open the notice board
	var nb = noticeBoard.instantiate()
	center_container.add_child(nb)
	nb.connect("closeNoticeBoard", closeNoticeBoard)
	nb.connect("noticeBoardSelected", noticeBoardSelected)
	pass # Replace with function body.

func closeNoticeBoard():
	notice_board_button.closeNoticeBoard()
	pass

var currentOpenNotice = null	
func noticeBoardSelected(selectedNotice, quest):
	currentOpenNotice = selectedNotice
	var n = potionNotice.instantiate()
	n.quest = quest
	center_container.add_child(n)
	n.connect("acceptedNotice", acceptedNotice)
	pass
func closedNotice():
	
	pass
	
func acceptedNotice():
	if currentOpenNotice != null:
		currentOpenNotice.modulate = Color(1,1,1,0)
	pass
