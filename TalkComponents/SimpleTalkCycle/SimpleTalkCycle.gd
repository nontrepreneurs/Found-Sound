extends Node

export(Array, PoolStringArray) var dialogues = null
onready var talk_radius: TalkRadius = get_node("../TalkRadius")
var dialogue_index = 0

const ON_TALK_SIGNAL = "on_talk_signal"

func _ready():
	assert(dialogues, "ERROR: SimpleTalkCycle dialogue property is probably null.")
	assert(dialogues.size() > 0, "ERROR: SimpleTalkCycle requires at least one dialogue.")
	
	assert(talk_radius, "ERROR: SimpleTalkCycle requires TalkRadius sibling.")
	talk_radius.connect(talk_radius.TALK_SIGNAL, self, ON_TALK_SIGNAL)

func on_talk_signal():
	var tmp_dialogues = []
	for dia_string in dialogues[dialogue_index]:
		tmp_dialogues.append(Dialogue.new(dia_string))
	DialogueManager.loadDialogue(tmp_dialogues)
	dialogue_index = (dialogue_index + 1) % dialogues.size()
