extends Node

func _input(event):
	if event.is_action_pressed("ui_accept"):
		DialogueManager.test()
