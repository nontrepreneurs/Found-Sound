extends Area2D

class_name SoundSource

const PULSE = "pulse"
const PULSE_SIZE_PARAM = "size"

export var is_playing: bool = false
export var pulse_size: float = 0
export var sample: Resource = null setget set_sample, get_sample

var anim: AnimationPlayer
var pulse_rect: ColorRect = null
var pulse_material: Material = null
var player: AudioStreamPlayer2D

func _ready():
	anim = $AnimationPlayer
	player = $AudioStreamPlayer2D
	#if (sound_stream):
	#	set_sound_stream(sound_stream)
	player.connect("finished", self, "on_player_finished")

	# Duplicates material so that shader params are unique to instance
	pulse_rect = $Node2D.get_node("ColorRect")
	pulse_rect.material = pulse_rect.material.duplicate(true)
	pulse_material = pulse_rect.material

func _process(delta):
	pulse_material.set_shader_param(PULSE_SIZE_PARAM, pulse_size)

func get_is_playing() -> bool:
	return is_playing

func set_sample(new_sample) -> void:
	sample = new_sample
	player.stream = sample.stream

func get_sample() -> Resource:
	return sample

func play_sound() -> void:
	is_playing = true
	player.play()
	pulse()
	#print("SoundSource is now playing: " + sound_name)

func has_sound() -> bool:
	return sample != null
	
func pulse() -> void:
	anim.current_animation = PULSE
	anim.stop()
	anim.play()

func on_player_finished() -> void:
	is_playing = false
	pulse_size = 0
