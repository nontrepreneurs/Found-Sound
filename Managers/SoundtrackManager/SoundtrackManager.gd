extends CanvasLayer

onready var SoundTrackPlayer = $SoundtrackPlayer
onready var outFade = $fadeOut
onready var inFade = $fadeIn

onready var tracks: Dictionary = {
	Constants.Soundtrack.CUTE: { 
		stream = preload("res://Assets/Music/Cute Theme.wav"), 
		position = 0 
	},
	Constants.Soundtrack.DOWN_IN_THE_DUMPS: {
		stream = preload("res://Assets/Music/downinthedumps_87bpm _Dmaj.wav"),
		position = 0
	} 
}


onready var duration = 1.0
onready var currentTrack = tracks[Constants.Soundtrack.CUTE]
onready var targetTrack = null

func _ready():
	$DeckA.stream = currentTrack.stream
	$DeckA.play(currentTrack.position)
	print_debug(" -> SoundtrackManager Ready")

func fadeOut(deck: AudioStreamPlayer):
	outFade.interpolate_property(deck, "volume_db", 0, -80, duration, 1, Tween.EASE_IN, 0)
	outFade.start()


func fadeIn(deck: AudioStreamPlayer):
	inFade.interpolate_property(deck, "volume_db", -80, 0, duration, 1, Tween.EASE_IN, 0)
	inFade.start()

func _on_Button_pressed():
	fadeOut($DeckA)

func _on_fadeOut_tween_completed(object, key):
	object.stop()
	object.stream = tracks[Constants.Soundtrack.DOWN_IN_THE_DUMPS].stream
	object.play()
	fadeIn(object)
	pass # Replace with function body.
