extends Node2D

export var condition: Resource = null #Tidbit

export(Array, PoolStringArray) var false_dialogues = null
var false_dialogue_index = 0

export(Array, PoolStringArray) var true_dialogues = null
var true_dialogue_index = 0

onready var talk_radius: TalkRadius = get_node("../TalkRadius")

const ON_TALK_SIGNAL = "on_talk_signal"

func _ready():
	assert(false_dialogues.size() > 0 and true_dialogues.size() > 0, "ERROR: ConditionalDialogue requires at least one dialogue for both true and false.")
	
	assert(talk_radius, "ERROR: ConditionalDialogue requires TalkRadius sibling.")
	talk_radius.connect(talk_radius.TALK_SIGNAL, self, ON_TALK_SIGNAL)
	
	assert(condition, "ERROR: ConditionalDialogue requires a 'condition' Tidbit.")

func on_talk_signal():
	var tmp_dialogues = []
	if (condition.value): # TRUE
		for dia_string in true_dialogues[true_dialogue_index]:
			tmp_dialogues.append(Dialogue.new(dia_string))
		true_dialogue_index = (true_dialogue_index + 1) % true_dialogues.size()
	else: # FALSE
		for dia_string in false_dialogues[false_dialogue_index]:
			tmp_dialogues.append(Dialogue.new(dia_string))
		false_dialogue_index = (false_dialogue_index + 1) % false_dialogues.size()
	DialogueManager.loadDialogue(tmp_dialogues)
	
