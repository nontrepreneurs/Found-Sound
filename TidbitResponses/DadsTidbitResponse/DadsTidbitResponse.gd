extends TidbitResponse

var dad_dialogue = [Dialogue.new("AW YA THAT THAT GOOD SHIT"), Dialogue.new("Please continue you lil bitch")]

func _on_target_matched():
	DialogueManager.loadDialogue(dad_dialogue)
