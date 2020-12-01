extends TidbitResponse

var dia = [Dialogue.new("Aw nice! Nice to have my sounds appreciated, y'know!")]

func _on_target_matched() -> void:
	DialogueManager.loadDialogue(dia)
