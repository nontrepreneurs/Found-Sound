extends Area2D

export var nextArea: String = "Homestead"

func _on_LocationTransition_body_entered(body):
	print("BODY PARTY")
	if body is Player:
		LocationManager.transitionTo(nextArea)

