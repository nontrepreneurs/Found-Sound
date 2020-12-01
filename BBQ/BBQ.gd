extends Node2D

export (Array, Resource) var conditions = []
export var win_condition: Resource = null

onready var characters = $CHARS

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(conditions.size() > 0, "BBQ requires win conditions")
	assert(win_condition, "BBQ requires a win condition tidbit.")
	var all_true = true
	for condition in conditions:
		if !condition.value:
			all_true = false
	if all_true:
		you_win()
	else:
		you_aint_win_yet()
		win_condition.value = true
		print("YOU WIN MAFK!")

func you_win():
	win_condition.value = true
	DialogueManager.loadDialogue([Dialogue.new("Foley! Why don't you come join us!")])
	print("YOU WIN MAFK!")

func you_aint_win_yet():
	print("YOU AINT WIN YET MAFK")
	characters.queue_free()
