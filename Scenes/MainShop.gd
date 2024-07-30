extends Node2D
@onready var canvas_layer = $CanvasLayer
@onready var notice_board_button = $CanvasLayer/NoticeBoardButton
@onready var center_container = $CanvasLayer/CenterContainer
@onready var grid = $grid
@onready var front_door = $FrontDoor
@onready var upgrade_shop = $UpgradShop
@onready var pause_menu = %PauseMenu
@onready var options_container = %OptionsContainer

var gameEndNotice = preload("res://UI/game_over.tscn")
var fine = preload("res://UI/fine_notice.tscn")
var noticeBoard = preload("res://UI/notice_board.tscn")
var potionNotice = preload("res://UI/potion_notice.tscn")

func _ready():
	pause_menu.process_mode = Node.PROCESS_MODE_WHEN_PAUSED	
	QuestManager.setTodaysQuests()
	QuestManager.maxedOutTurnForDay.connect(onEndOfDay)
	Global.gameWon.connect(OnWin)
	Global.gameOver.connect(OnLoose)
	pass # Replace with function body.

func onDayEnd():
	QuestManager.setTodaysQuests()
	QuestManager.updateQuestDays()

func openNoticeBoard():
	if !Global.shopOpen:
		SoundManager.playSound("menu")
		var nb = noticeBoard.instantiate()
		center_container.add_child(nb)
		nb.connect("closeNoticeBoard", closeNoticeBoard)
		nb.connect("noticeBoardSelected", noticeBoardSelected)
		pass # Replace with function body.

func closeNoticeBoard():
	notice_board_button.closeNoticeBoard()
	pass

var currentOpenNotice = null
var openPotionNotice = null
func noticeBoardSelected(selectedNotice, quest):
	if openPotionNotice != null:
		openPotionNotice.queue_free()
		openPotionNotice = null
		
	currentOpenNotice = selectedNotice
	var n = potionNotice.instantiate()
	n.quest = quest
	center_container.add_child(n)
	n.connect("acceptedNotice", acceptedNotice)
	openPotionNotice = n
	pass
func closedNotice():
	currentOpenNotice = null
	pass
	
func acceptedNotice():
	if currentOpenNotice != null:
		currentOpenNotice.modulate = Color(1,1,1,0)
	pass

func onEndOfDay():
	#TODO pop up the options for the end of day
	#	- users can select upgrades
	#	- user can reset the board for a fee
	QuestManager.curDay += 1
	pass


func _on_restock_pressed():
	if !Global.shopOpen:
		onEndOfDay()
		grid.clearBoard()
	pass # Replace with function body.

func displayFine():
	var f = fine.instantiate()
	center_container.add_child(f)
	pass

func onStringPulled():
	if !Global.shopOpen:
		front_door.onStringPulled()

func openShop():
	upgrade_shop.onOpen()

func OnWin():
	var geN = gameEndNotice.instantiate()
	geN.won = true
	center_container.add_child(geN)
	front_door.pauseInvestigator(true)
	pass
	
func OnLoose():
	var geN = gameEndNotice.instantiate()
	geN.won = false
	center_container.add_child(geN)
	front_door.pauseInvestigator(true)
	pass


func onPauseClicked():
	pause()
	#pause_sound.play()
	options_container.grabReturnFocus()


func resumePressed():
	get_tree().paused = false
	#unpause_sound.play()
	pause_menu.visible = !pause_menu.visible
	pass
		
		
func pause():
	get_tree().paused = !get_tree().paused 
	pause_menu.visible = !pause_menu.visible
