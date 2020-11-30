extends Area2D

onready var player = get_node("../Map/Player")

export(Constants.Soundtrack) var song = Constants.Soundtrack.CUTE


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_SoundtrackArea_body_entered(body):
	print("got body enter: ", SoundtrackManager.deck.playing, song, SoundtrackManager.currentTrack)
	if body == player:
		print("also player")
		if song != SoundtrackManager.currentTrack or SoundtrackManager.currentTrack == null:
			SoundtrackManager.transitionSong(song)
#		else:
#			print("pass")
