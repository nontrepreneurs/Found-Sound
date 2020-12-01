extends TidbitResponse

var dia = [
	Dialogue.new("Hey nice! You've recorded my bangin sounds!"),
	Dialogue.new("Bro, my sounds can make people dance or make people shuffle off!"),
	Dialogue.new("It's either just right, or too much!")
	]

func _on_target_matched() -> void:
	DialogueManager.loadDialogue(dia)
