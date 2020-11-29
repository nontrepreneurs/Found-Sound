extends TidbitResponse

var dia = [Dialogue.new("mmmm ya record my sounds")]

func _on_target_matched() -> void:
	DialogueManager.loadDialogue(dia)
