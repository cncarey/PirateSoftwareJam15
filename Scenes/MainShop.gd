extends Node2D
@onready var canvas_layer = $CanvasLayer
@onready var notice_board_button = $CanvasLayer/NoticeBoardButton
@onready var center_container = $CanvasLayer/CenterContainer


var noticeBoard = preload("res://UI/notice_board.tscn")
# Called when the node enters the scene tree for the first time.
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
	pass # Replace with function body.

func closeNoticeBoard():
	notice_board_button.closeNoticeBoard()
	pass
