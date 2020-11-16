extends Area2D

class_name SoundListener

export var any_sound: bool = false
export var target_sound: String = ""
export var stop_list_after_heard: bool = true

signal heard_sound(sound)
var is_listening: bool = true setget set_is_listening, get_is_listening

func _process(delta: float):
	if is_listening:
		listen()
	
func set_is_listening(state: bool) -> void:
	is_listening = state

func get_is_listening() -> bool:
	return is_listening
	
func listen() -> void:
	var name_heard
	var stream_heard
	var sound_sources = get_overlapping_areas()
	for sound_source in sound_sources:
		if sound_source.get_is_playing():
			name_heard = sound_source.get_sound_name()
			stream_heard = sound_source.get_sound_stream()
			is_listening = false
			print("I HEARD: ", name_heard)
			if (any_sound or name_heard == target_sound):
				emit_signal("heard_sound", sound_source.get_sound_name(), sound_source.get_sound_stream())
