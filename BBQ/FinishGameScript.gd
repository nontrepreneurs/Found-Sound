extends Node2D

onready var talk_radius: TalkRadius = get_node("../TalkRadius")
#onready var end_screen = $EndScreen

const ON_TALK_SIGNAL = "on_talk_signal"

func _ready():	
	assert(talk_radius, "ERROR: FinishGameScript requires TalkRadius sibling.")
	talk_radius.connect(talk_radius.TALK_SIGNAL, self, ON_TALK_SIGNAL)

func on_talk_signal():
	print("GAME OVER MAN")
#	end_screen.visible = true
