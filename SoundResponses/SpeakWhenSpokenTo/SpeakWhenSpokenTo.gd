extends Node2D

var label: Label = null
var listener: SoundListener = null

func _ready():
	label = get_node("Label")
	label.visible = false
	
	listener = get_node("../SoundListener")
	listener.connect("heard_sound", self, "on_listener_heard")

func on_listener_heard(sound_name: String, sound_stream: AudioStream) -> void:
	print("SpeakWhenSpokenTo's listener heard:", sound_name, sound_stream)
	label.visible = true
