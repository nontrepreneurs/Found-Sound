extends Node


var currentSong = ""
var soundtrack = {
	"cutetheme": load("res://Music/cutetheme.ogg"),
	"grief": load("res://Music/griefdrips.wav")
}


func playMusic(trackname: String):
	$Music.stream = soundtrack[trackname]
	$Music.play(0)
	currentSong = trackname



