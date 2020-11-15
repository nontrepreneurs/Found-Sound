extends Area2D

class_name SoundListener

signal heard_sound(sound)
var is_listening: bool = true setget set_is_listening, get_is_listening

func _process(delta):
	if is_listening:
		listen()
	
func set_is_listening(state):
	is_listening = state

func get_is_listening():
	return is_listening
	
func listen():
	var sound_sources = get_overlapping_areas()
	for sound_source in sound_sources:
		if sound_source.get_is_playing():
			emit_signal("heard_sound", sound_source.get_sound())
