extends KinematicBody2D

export var has_recorded_vinnie: Resource = null

onready var sound_source: SoundSource = $SoundSource
#onready var talk_radius: TalkRadius = $TalkRadius

#var vinnie_dialogue = [Dialogue.new("YOU'RE TALKING TO vinnie basura")]

#const ON_TALK_SIGNAL = "on_talk_signal"

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(sound_source, "ERROR: VinnieBasura requires a SoundSource child.")
	assert(has_recorded_vinnie, "ERROR: VinnieBasura requires a tidbit property.")
#	assert(talk_radius, "ERROR: VinnieBasura requires a talk_radius.")
#	talk_radius.connect(talk_radius.TALK_SIGNAL, self, ON_TALK_SIGNAL)

func _process(delta):
	if !has_recorded_vinnie.value and SamplerManager.current_sample == sound_source.sample:
		has_recorded_vinnie.value = true

#func on_talk_signal():
#	DialogueManager.loadDialogue(vinnie_dialogue)
