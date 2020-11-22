extends Area2D

class_name SoundSource

const PULSE = "pulse"
const PULSE_SIZE_PARAM = "size"

export var is_playing: bool = false
export var sound: String = ""
export var pulse_size: float = 0

var anim: AnimationPlayer
var pulse_material: Material = null

func _ready():
	anim = $AnimationPlayer
	#pulse_material = $CanvasLayer.get_node("ColorRect").material
	pulse_material = $ColorRect.material

func _process(delta):
	pulse_material.set_shader_param(PULSE_SIZE_PARAM, pulse_size)

func get_is_playing() -> bool:
	return is_playing

func get_sound() -> String:
	return sound

func set_sound(new_sound: String):
	sound = new_sound

func play_sound() -> void:
	is_playing = true
	pulse()
	print("Now playing:" + sound)

func has_sound() -> bool:
	return sound != null
	
func pulse() -> void:
	print("I'm pulsing now")
	anim.current_animation = PULSE

	anim.play()
