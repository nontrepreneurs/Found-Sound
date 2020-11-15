extends Area2D

const PULSE = "pulse"
const PULSE_SIZE_PARAM = "size"

#export var stream: AudioStream = null
export var is_playing: bool = false
export var sound: String = ""
#export var playing_color = Color.red
export var pulse_size: float = 0
#var not_playing_color = null
#var player = null
#var debug_rect = null
var anim: AnimationPlayer
var pulse_material: Material = null


func _ready():
	#player = get_node("AudioStreamPlayer2D")
	#debug_rect = get_node("ColorRect2")
#	set_stream(stream)
#	not_playing_color = debug_rect.color
	anim = $AnimationPlayer
	pulse_material = $CanvasLayer.get_node("ColorRect").material

func _process(delta):
	pulse_material.set_shader_param(PULSE_SIZE_PARAM, pulse_size)

#func set_stream(new_stream: AudioStream):
#	print("YO I GOT CALLED MAFK")
#	player.stream = new_stream

func get_is_playing():
	return is_playing

func get_sound():
	return sound

func set_sound(new_sound: String):
	sound = new_sound
	#player.stream = stream

func play_sound():
	#debug_rect.color = playing_color
	#is_playing = true
	#player.play()
	pulse()
	print("Now playing:" + sound)

func has_sound():
	return sound != null
#	return player.stream != null
	
func pulse():
	anim.current_animation = PULSE
	anim.play()

#func _on_AudioStreamPlayer2D_finished():
#	debug_rect.color = not_playing_color
#	is_playing = false
