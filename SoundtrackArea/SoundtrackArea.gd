extends Area2D

onready var player = get_node("../Map/Player")

export(Constants.Soundtrack) var song = Constants.Soundtrack.CUTE


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_SoundtrackArea_body_entered(body):
	print("FUCK")
	if body == player:
		print("we got a body")
		SoundtrackManager.transitionSong(song)
