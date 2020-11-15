extends Area2D

const RECORD_ACTION = "ui_accept"
const PLAY_SOUND_ACTION = "ui_cancel"

var is_recording = false
var recorded_sound = null
var sound_source = null

func _ready():
	sound_source = $Sampleable

func _process(delta):
	if Input.is_action_just_pressed(RECORD_ACTION):
		record_sound()
	if Input.is_action_just_pressed(PLAY_SOUND_ACTION):
		play_sound()
	
func record_sound():
	print("RECORDING SOUND BOI")
	var sampleables = get_sampleables()
	for sampleable in sampleables:
		if sampleable.get_is_playing():
			recorded_sound = sampleable.get_sound()
			sound_source.set_sound(recorded_sound)
			print("Sound recorded!")

func play_sound():
	print("PLAYING SOUND BOI")
	if sound_source.has_sound():
		sound_source.play_sound()

func get_sampleables():
	return get_overlapping_areas()
