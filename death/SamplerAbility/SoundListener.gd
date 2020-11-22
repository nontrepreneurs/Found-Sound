extends Area2D

class_name SoundListener

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
	var sound_sources = get_overlapping_areas()
	for sound_source in sound_sources:
		if sound_source.get_is_playing():
			print("I HEARD: ", sound_source.get_sound())
			emit_signal("heard_sound", sound_source.get_sound())