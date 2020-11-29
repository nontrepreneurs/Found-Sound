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


onready var duration = 0.5

onready var currentTrack = Constants.Soundtrack.CUTE
onready var prevTrack = null

func _ready():
	$DeckA.stream = tracks[currentTrack].stream
	$DeckA.play(tracks[currentTrack].position)
	print_debug(" -> SoundtrackManager Ready")

func fadeOut(deck: AudioStreamPlayer):
	outFade.interpolate_property(deck, "volume_db", 0, -80, duration, 1, Tween.EASE_IN, 0)
	outFade.start()


func fadeIn(deck: AudioStreamPlayer):
	inFade.interpolate_property(deck, "volume_db", -80, 0, duration, 1, Tween.EASE_IN, 0)
	inFade.start()


func transitionSong(track: int):
	prevTrack = currentTrack
	currentTrack = track
	fadeOut($DeckA)
	pass

onready var flip = true
func _on_Button_pressed():
	if flip:
		transitionSong(Constants.Soundtrack.DOWN_IN_THE_DUMPS)
	else:
		transitionSong(Constants.Soundtrack.CUTE)
	flip = !flip

func _on_fadeOut_tween_completed(object, key):
	tracks[prevTrack].position = object.get_playback_position()
	object.stop()
	object.stream = tracks[currentTrack].stream
	object.play(tracks[currentTrack].position)
	fadeIn(object)
