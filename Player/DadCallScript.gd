extends Node2D

export (Array, Resource) var conditions = null
export var DadHasCalled: Resource = null

onready var player = get_node("..")
onready var timer: Timer = $Timer

func _process(delta):
	var all_true = true
	if player.can_move() and DadHasCalled.value == false:
		for condition in conditions:
			if condition.value == false:
				all_true = false
		if all_true:
			have_dad_call()

func have_dad_call():
	DadHasCalled.value = true
	timer.start()

func _on_Timer_timeout():
	DialogueManager.loadDialogue([
		Dialogue.new("Hey Foley! It's your dad calling!"),
		Dialogue.new("Why don't you come by the house, some of the folks you've helped out are here for a barbeque!")
		])
