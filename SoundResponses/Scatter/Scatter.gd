extends Node2D

const SCATTER = "scatterAnimation"

export var speed: float = 250.0

var label: Label = null
var listener: SoundListener = null
var rng: RandomNumberGenerator = null
#var rng = RandomNumberGenerator.new()
var heading: Vector2 = Vector2.UP
var is_scattering: bool = false
var anim: AnimationPlayer = null
var parent: Node2D = null

func _ready():
	listener = get_node("../SoundListener")
	listener.connect("heard_sound", self, "on_listener_heard")
	
	parent = get_node("..")
	anim = $AnimationPlayer
	
	rng = RandomNumberGenerator.new()
	rng.randomize()

func _process(delta):
	if is_scattering:
		#print("we scattering now", heading)
		parent.translate(heading * speed * delta)

func scatter():
	heading = Vector2(rng.randf_range(-1.0, 1.0), rng.randf_range(-1.0, 1.0)).normalized()
	is_scattering = true

func stop_scattering():
	is_scattering = false
	listener.is_listening = true

func on_listener_heard(sound_name: String, sound_stream: AudioStream) -> void:
	print("Scatter's listener heard:", sound_name, sound_stream)
	anim.stop()
	anim.current_animation = SCATTER
	anim.play()
