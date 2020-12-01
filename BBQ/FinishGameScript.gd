extends Node2D

onready var talk_radius: TalkRadius = get_node("../TalkRadius")

const ON_TALK_SIGNAL = "on_talk_signal"

func _ready():
	assert(talk_radius, "ERROR: FinishGameScript requires TalkRadius sibling.")
	talk_radius.connect(talk_radius.TALK_SIGNAL, self, ON_TALK_SIGNAL)

func on_talk_signal():
	get_node("../../../../CanvasLayer/ColorRect").visible = true
	SoundtrackManager.transitionSong(Constants.Soundtrack.VICTORY)
	print("GAME OVER MAN")
#	end_screen.visible = true
