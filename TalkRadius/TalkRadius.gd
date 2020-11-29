extends Area2D
class_name TalkRadius

onready var label: Label = $Label
var talkable = false
var someone_is_talking: Resource = load("res://Tidbits/SomeoneIsTalking.tres")

const TALK_ACTION = "confirm"
const TALK_SIGNAL = "talk_signal"
signal talk_signal()

func _input(event):
	if talkable and event.is_action_pressed(TALK_ACTION) and !someone_is_talking.value:
		emit_signal(TALK_SIGNAL)

func _on_Area2D_body_entered(body):
	if body is Player:
		talkable = true
		label.visible = true

func _on_Area2D_body_exited(body):
	if body is Player and talkable == true:
		talkable = false
		label.visible = false


func _on_TalkRadius_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
