extends CanvasLayer



func _on_Button_pressed():
	

#	DialogueManager.createDialogue([ { text = txt + palsy }])
	var dialogue = Dialogue.new(
		"i find it disturbing how long it takes me to do certain things",
		0.25
	)
	
	var dialogue2 = Dialogue.new(
		"who cares? i have money",
		0.05
	)
	
	DialogueManager.loadDialogue([dialogue, dialogue2])
