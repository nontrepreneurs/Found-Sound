extends Node

export var dialogues: PoolStringArray = []
onready var talk_radius: TalkRadius = get_node("../TalkRadius")
var dialogue_index = 0

const ON_TALK_SIGNAL = "on_talk_signal"


func _ready():
	assert(dialogues.size() > 0, "ERROR: SimpleTalkCycle requires at least one dialogue.")
	
	assert(talk_radius, "ERROR: SimpleTalkCycle requires TalkRadius sibling.")
	talk_radius.connect(talk_radius.TALK_SIGNAL, self, ON_TALK_SIGNAL)

func on_talk_signal():
	dialogue_index = (dialogue_index + 1) % dialogues.size()
	DialogueManager.loadDialogue([Dialogue.new(dialogues[dialogue_index])])
