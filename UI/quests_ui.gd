extends MarginContainer

var QuestItem = preload("res://UI/quest_item.tscn")

@onready var quest_count = %QuestCount
@onready var grid_container = %GridContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	QuestManager.QuestAccepted.connect(addQuest)
	QuestManager.quests_changed.connect(updateAllQuests)
	pass # Replace with function body.

func addQuest(q, questCount):
	quest_count.text = str(questCount) + "/" + str(QuestManager.questMaxCount)
	var qi = QuestItem.instantiate()
	qi.quest = q
	grid_container.add_child(qi)
	pass
	
func updateAllQuests(quests):
	
	quest_count.text = str(quests.size()) + "/" + str(QuestManager.questMaxCount)
	for gc in grid_container.get_children():
		grid_container.remove_child(gc)
		gc.queue_free()
	
	for q in quests:
		var qi = QuestItem.instantiate()
		qi.quest = q
		grid_container.add_child(qi)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
