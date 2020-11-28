extends Node2D

const RECORD_ACTION = "record_sound"
const PLAY_SOUND_ACTION = "play_sound"
const ON_SAMPLE_MANAGER_SAMPLE_CHANGED = "on_SamplerManager_sample_changed"

var is_recording = false
var recorded_sound = null
var sound_source = null
var listener = null

func _ready():
	sound_source = $SoundSource
	assert(sound_source, "ERROR: SoundSource child required for SamplerAbility")
	if (SamplerManager.current_sample):
		set_sample(SamplerManager.current_sample)
	
	listener = $SoundListener
	assert(listener, "ERROR: SoundListener child required for SamplerAbility")
	listener.is_listening = false
	listener.connect("heard_sound", self, "on_listener_heard")
	
	SamplerManager.connect(SamplerManager.SAMPLE_CHANGED_SIGNAL, self, ON_SAMPLE_MANAGER_SAMPLE_CHANGED)

func _process(delta):
	if Input.is_action_just_pressed(RECORD_ACTION):
		record_sound()
	if Input.is_action_just_pressed(PLAY_SOUND_ACTION):
		play_sound()
	
func record_sound():
	print("SamplerAbility is trying to record.")
	listener.listen()

func play_sound():
	if sound_source.has_sound():
		sound_source.play_sound()
	else:
		print("No sound recorded!")

func set_sample(sample: Sample) -> void:
	SamplerManager.current_sample = sample
	sound_source.sample = sample

func on_listener_heard(sample_heard: Sample) -> void:
	print("SamplerAbility's listener heard:", sample_heard.name, sample_heard.stream)
	set_sample(sample_heard)

func on_SamplerManager_sample_changed(new_sample:Sample) -> void:
	sound_source.sample = new_sample
