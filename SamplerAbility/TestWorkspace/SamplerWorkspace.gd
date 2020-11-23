extends Node2D

var my_listener: SoundListener = null

func _ready():
	my_listener = $SoundListener

func _on_SoundListener_heard_sound(sound):
	print("YO I JUST HEARD A FUCKIN SOUND DUDE")
	my_listener.is_listening = false
