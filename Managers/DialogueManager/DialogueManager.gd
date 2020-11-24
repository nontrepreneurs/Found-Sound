# DialogueManager:
# The purpose of this manager is to spawn an instance of DialogueBox.

# In turn that DialogueBox should know how to free itself after it's 
# animations and text have been displayed.

# Stretch Goals:
# * if dialogue box is already in use... queue additional dialogues.

extends CanvasLayer

const dialogueBox: PackedScene = preload("res://DialogueBox/DialogueBox.tscn")


func test():
	var dialogue = Dialogue.new(
		"Remember son...",
		0.05
	)
	
	var dialogue2 = Dialogue.new(
		StringMan.shake("If you want to skip past what I have to say you can always just press the X button."),
		0.15
	)
	
	var dialogue3 = Dialogue.new(
		"You never really do know when I'll feel like...",
		0.05
	)
	
	var dialogue4 = Dialogue.new(
		"Droning " + StringMan.tornado("on", 4) + " and " + StringMan.tornado("on", 7) + " and " + StringMan.tornado("on", 9) + " . . .",
		0.35
	)
	
	DialogueManager.loadDialogue([dialogue, dialogue2, dialogue3, dialogue4])

func loadDialogue(dialogue: Array):
	if $DialogueBox:
		print("we've got one already...")
	else:
		var node = dialogueBox.instance()
		node.set("dialogue", dialogue)
		add_child(node)

func _ready():
	print("manager ready")

#	$DialogueBox/Dialogue.bbcode_text = wavy("fuck this...") + tornado("i'm a bad bitch") + shake("don't fuck w/ me") + fade("we all die someday...")
