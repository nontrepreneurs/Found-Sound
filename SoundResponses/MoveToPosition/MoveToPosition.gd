extends Node

export var speed: float = 200.0

const HEARD_SOUND_SIGNAL = "heard_sound"
var parent: KinematicBody2D = null
var listener: SoundListener = null
var target: Position2D = null
var target_position: Vector2 = Vector2()
var is_moving: bool = false

func _ready():
	print("am i even running")
	parent = get_node("..")
	
	if parent.get_node("Position2D"):
		target = parent.get_node("Position2D")
	else:
		target = $Position2D
	assert(target, "ERROR: MoveToPosition node requires a Position2D node as a sibling or a child.")
	target_position = target.global_position
	
	listener = parent.get_node("SoundListener")
	listener.connect(HEARD_SOUND_SIGNAL, self, "on_listener_heard")

func _process(delta: float):
	if (is_moving):
		move(delta)
		
func move(delta: float) -> void:
	if parent.global_position.distance_to(target_position) > 5:
		parent.translate(parent.global_position.direction_to(target_position) * speed * delta)
	else:
		is_moving = false

func on_listener_heard(sample_heard: Sample) -> void:
	is_moving = true
