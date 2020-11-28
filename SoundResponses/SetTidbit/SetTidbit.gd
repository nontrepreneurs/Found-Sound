extends Node2D

export var tidbit: Resource = null
export var value: bool = true

var listener: SoundListener = null

func _ready():
	listener = get_node("../SoundListener")
	assert(listener, "ERROR: SetTidbit nodes require a SoundListener sibling.")
	listener.connect(listener.HEARD_SOUND_SIGNAL, self, "on_listener_heard")

	assert(tidbit, "ERROR: SetTidbit node is missing a Tidbit property.")

func on_listener_heard(sample: Sample) -> void:
	print("IN SETTIDBIT ON LISTENER")
	tidbit.value = value
