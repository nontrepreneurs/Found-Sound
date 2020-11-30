extends CanvasLayer

func _ready():
	SoundtrackManager.transitionSong(Constants.Soundtrack.CUTE)

func _input(event):
	if event is InputEventKey and event.pressed:
		get_tree().change_scene("res://Location/Areas/Homestead/Homestead.tscn")
