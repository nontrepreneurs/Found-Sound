extends Area2D

class_name SoundListener

export var any_sound: bool = false 
export var target_sample: Resource = null
export var stop_list_after_heard: bool = true
export var start_listening: bool = false

const HEARD_SOUND_SIGNAL = "heard_sound"
signal heard_sound(sample)
var is_listening: bool = false setget set_is_listening, get_is_listening

func _ready():
	is_listening = start_listening

func _process(delta: float):
	if is_listening:
		listen()

func set_is_listening(state: bool) -> void:
	is_listening = state

func get_is_listening() -> bool:
	return is_listening
	
func listen() -> void:
	var sample_heard: Sample
	# does a simple search for overlapping Area2Ds with the idea being that
	# only SoundSources will have the proper collision mask to overlap
	var sound_sources = get_overlapping_areas()
	for sound_source in sound_sources:
		if sound_source.get_is_playing():
			sample_heard = sound_source.get_sample()
			print("SoundListener heard: ", sample_heard.name)
			if (any_sound or sample_heard.name == target_sample.name):
				print("in here dog", target_sample.name if target_sample else "any soundll do")
				if stop_list_after_heard:
					is_listening = false
				emit_signal(HEARD_SOUND_SIGNAL, sample_heard)
