extends KinematicBody2D

export var has_recorded_vinnie: Resource = null

onready var sound_source: SoundSource = $SoundSource

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(sound_source, "ERROR: VinnieBasura requires a SoundSource child.")
	
	assert(has_recorded_vinnie, "ERROR: VinnieBasura requires a tidbit property.")

func _process(delta):
	if !has_recorded_vinnie.value and SamplerManager.current_sample == sound_source.sample:
		has_recorded_vinnie.value = true
