extends Node2D

export var animation_name: String = ""

var player: AnimationPlayer = null
var listener: SoundListener = null

const ON_HEARD_SAMPLE_SIGNAL = "on_listener_heard"

func _ready():
	player = get_node("../AnimationPlayer")
	assert(player, "ERROR: StartAnimation requires an AnimationPlayer sibling.")

	listener = get_node("../SoundListener")
	assert(listener, "ERROR: StartAnimation requires a SoundListener sibling.")
	listener.connect(listener.HEARD_SOUND_SIGNAL, self, ON_HEARD_SAMPLE_SIGNAL)
	
	assert(animation_name != "", "ERROR: StartAnimation requires an animation name.")
	
func on_listener_heard(sample: Sample) -> void:
	player.current_animation = animation_name
	player.play()
