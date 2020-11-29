extends Node2D

export(Array, PoolStringArray) var dialogues = null
var dialogue_index = 0
var listener: SoundListener = null

const ON_LISTENER_HEARD = "on_listener_heard"

func _ready():
	listener = get_node("../SoundListener")
	assert(listener, "ERROR: SayDialogue requires a sibling SoundListener.")
	listener.connect(listener.HEARD_SOUND_SIGNAL, self, ON_LISTENER_HEARD)
	assert(dialogues.size() > 0, "ERROR: SayDialogue requires at least one dialogue.")

func on_listener_heard(sample: Sample) -> void:
	var tmp_dialogues = []
	for dia_string in dialogues[dialogue_index]:
		tmp_dialogues.append(Dialogue.new(dia_string))
	DialogueManager.loadDialogue(tmp_dialogues)
	dialogue_index = (dialogue_index + 1) % dialogues.size()
