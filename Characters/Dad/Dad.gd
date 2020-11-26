extends KinematicBody2D

var talkable = false;

var dia = [Dialogue.new("fuck man you can't get past me lol"), Dialogue.new(StringMan.shake("f u c k you ahahah"))]

func _input(event):
	if talkable and event.is_action_pressed("confirm"):
		DialogueManager.loadDialogue(dia)

func _on_TalkRadius_input_event(viewport, event, shape_idx):
	print("pingo")
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		print("fucknuts")
		pass
	pass # Replace with function body.


func _on_TalkRadius_body_entered(body):
	if body is Player:
		talkable = true
		



func _on_TalkRadius_body_exited(body):
	if body is Player and talkable ==true:
		talkable = false
