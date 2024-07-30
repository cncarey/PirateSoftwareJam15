extends MarginContainer

@onready var days_left = %DaysLeft
@onready var purple_container = %PurpleContainer
@onready var purple_icon = %PurpleIcon
@onready var purple_count = %PurpleCount
@onready var blue_container = %BlueContainer
@onready var blue_icon = %BlueIcon
@onready var blue_count = %BlueCount
@onready var orange_container = %OrangeContainer
@onready var orange_icon = %OrangeIcon
@onready var orange_count = %OrangeCount
@onready var green_container = %GreenContainer
@onready var green_icon = %GreenIcon
@onready var green_count = %GreenCount
@onready var pink_container = %PinkContainer
@onready var pink_icon = %PinkIcon
@onready var pink_count = %PinkCount

var quest = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	if quest.has("days")&& quest.has("curDay"):
		var daysLeft = quest["days"] - quest["curDay"]
		days_left.text = str(daysLeft)+" days left"
	else:	
		days_left.text = str(quest["daysLeft"])+" days left"
	
	#show the reqs potions
	if quest.has(0):
		purple_container.show()
		purple_count.text = str(quest[0])
	if quest.has(1):
		blue_container.show()
		blue_count.text = str(quest[1])
	if quest.has(2):
		orange_container.show()
		orange_count.text = str(quest[2])
	if quest.has(3):
		green_container.show()
		green_count.text = str(quest[3])
	if quest.has(4):
		pink_container.show()
		pink_count.text = str(quest[4])
	
	onPurpleChange(Global.purple)
	onBlueChange(Global.blue)
	onOrangeChange(Global.orange)
	onGreenChange(Global.green)
	onPinkChange(Global.pink)	
		
	Global.purple_changed.connect(onPurpleChange)
	Global.blue_changed.connect(onBlueChange)
	Global.orange_changed.connect(onOrangeChange)
	Global.green_changed.connect(onGreenChange)
	Global.pink_changed.connect(onPinkChange)

func onComplete():
	#TODO verify that you have the materials
	#	remove from the stock
	var hasAllReq = true
	#TODO shake the ones that turn it false
	if quest.has(0):
		if Global.purple < quest[0]:
			hasAllReq = false
	if quest.has(1):
		if Global.blue < quest[1]:
			hasAllReq = false
	if quest.has(2):
		if Global.orange < quest[2]:
			hasAllReq = false
	if quest.has(3):
		if Global.green < quest[3]:
			hasAllReq = false
	if quest.has(4):
		if Global.pink < quest[4]:
			hasAllReq = false
	
	if hasAllReq:
		if quest.has(0):
			Global.tryTakePurple(quest[0])
		if quest.has(1):
			Global.tryTakeBlue(quest[1])
		if quest.has(2):
			Global.tryTakeOrange(quest[2])
		if quest.has(3):
			Global.tryTakeGreen(quest[3])
		if quest.has(4):
			Global.tryTakePink(quest[4])
		SoundManager.playSound("coins")
		QuestManager.completeQuest(quest)
		queue_free()
	pass

func onRemove():
	SoundManager.playSound("menu")
	QuestManager.removeQuest(quest)
	queue_free()
	
func onPurpleChange(count):
	if quest.has(0):
		purple_icon.material.set_shader_parameter("start", count >= quest[0])
	
func onBlueChange(count):
	if quest.has(1):
		blue_icon.material.set_shader_parameter("start", count >= quest[1])
	
func onOrangeChange(count):
	if quest.has(2):
		orange_icon.material.set_shader_parameter("start", count >= quest[2])
	
func onGreenChange(count):
	if quest.has(3):
		green_icon.material.set_shader_parameter("start", count >= quest[3])
	
func onPinkChange(count):
	if quest.has(4):
		pink_icon.material.set_shader_parameter("start", count >= quest[4])
