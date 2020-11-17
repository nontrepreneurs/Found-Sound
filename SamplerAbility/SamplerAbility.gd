extends Area2D

const RECORD_ACTION = "record_sound"
const PLAY_SOUND_ACTION = "play_sound"

var is_recording = false
var recorded_sound = null
var sound_source = null
var listener = null

func _ready():
	sound_source = $SoundSource
	listener = $SoundListener
	listener.is_listening = false
	listener.connect("heard_sound", self, "on_listener_heard")

func _process(delta):
	if Input.is_action_just_pressed(RECORD_ACTION):
		record_sound()
	if Input.is_action_just_pressed(PLAY_SOUND_ACTION):
		play_sound()
	
func record_sound():
	print("SamplerAbility is trying to record.")
	listener.listen()

func play_sound():
	if sound_source.has_sound():
		sound_source.play_sound()
	else:
		print("No sound recorded!")

func on_listener_heard(sound_name: String, sound_stream: AudioStream) -> void:
	print("SamplerAbility's listener heard:", sound_name, sound_stream)
	sound_source.set_sound_name(sound_name)
	sound_source.set_sound_stream(sound_stream)
