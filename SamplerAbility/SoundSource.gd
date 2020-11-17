extends Area2D

class_name SoundSource

const PULSE = "pulse"
const PULSE_SIZE_PARAM = "size"

export var is_playing: bool = false
export var pulse_size: float = 0
export var sound_name: String = ""
export var sound_stream: AudioStream = null

var anim: AnimationPlayer
var pulse_rect: ColorRect = null
var pulse_material: Material = null
var player: AudioStreamPlayer2D

func _ready():
	anim = $AnimationPlayer
	player = $AudioStreamPlayer2D
	if (sound_stream):
		set_sound_stream(sound_stream)
	player.connect("finished", self, "on_player_finished")

	# Duplicates material so that shader params are unique to instance
	pulse_rect = $Node2D.get_node("ColorRect")
	pulse_rect.material = pulse_rect.material.duplicate(true)
	pulse_material = pulse_rect.material

func _process(delta):
	pulse_material.set_shader_param(PULSE_SIZE_PARAM, pulse_size)

func get_is_playing() -> bool:
	return is_playing

func get_sound_name() -> String:
	return sound_name

func set_sound_name(new_sound: String):
	sound_name = new_sound

func get_sound_stream() -> AudioStream:	
	return sound_stream
	
func set_sound_stream(new_stream: AudioStream):
	sound_stream = new_stream
	player.stream = sound_stream
	return sound_stream

func play_sound() -> void:
	is_playing = true
	player.play()
	pulse()
	#print("SoundSource is now playing: " + sound_name)

func has_sound() -> bool:
	return sound_stream != null
	
func pulse() -> void:
	# print("I'm pulsing now")
	anim.current_animation = PULSE
	anim.stop()
	anim.play()

func on_player_finished() -> void:
	#print("SoundSource Player finished.")
	is_playing = false
	pulse_size = 0
