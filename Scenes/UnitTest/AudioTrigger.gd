extends Area2D

export var song = "grief"
var prevSong = ""
var playerEntered: bool = false


func _on_Timer_timeout():
#	prevSong = MusicManager.currentSong
	if song != MusicManager.currentSong:
		prevSong = MusicManager.currentSong
		MusicManager.playMusic(song)
	else:
		MusicManager.playMusic(prevSong)

func _on_AudioTrigger_body_entered(body):
	if body == GameManager.player:
		$Timer.start(0)

func _on_AudioTrigger_body_exited(body):
	pass

