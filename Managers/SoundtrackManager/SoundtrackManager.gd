extends CanvasLayer

onready var deck = $DeckA
onready var outFade = $fadeOut
onready var inFade = $fadeIn

onready var tracks: Dictionary = {
	Constants.Soundtrack.CUTE: { 
		stream = preload("res://Assets/Music/cutetheme.ogg"), 
		position = 0 
	},
	Constants.Soundtrack.DOWN_IN_THE_DUMPS: {
		stream = preload("res://Assets/Music/downinthedumps.ogg"),
		position = 0
	},
	Constants.Soundtrack.AMBIENT: {
		stream = preload("res://Assets/Music/birdandwind.ogg"),
		position = 0
	},
	Constants.Soundtrack.PAWS_FOR_EFFECT: {
		stream = preload("res://Assets/Music/chillcat.ogg"),
		position = 0
	},
	Constants.Soundtrack.VICTORY: {
		stream = preload("res://Assets/Music/victory.ogg"),
		position = 0
	}
}


onready var duration = 0.5

onready var currentTrack = null
onready var prevTrack = null

func _ready():
	print_debug(" -> SoundtrackManager Ready")

func fadeOut(deck: AudioStreamPlayer):
	outFade.interpolate_property(deck, "volume_db", -10, -80, duration, 1, Tween.EASE_IN, 0)
	outFade.start()


func fadeIn(deck: AudioStreamPlayer):
	inFade.interpolate_property(deck, "volume_db", -80, -10, duration, 1, Tween.EASE_IN, 0)
	inFade.start()


func transitionSong(track: int):
	
	if currentTrack == null:
		prevTrack = track
	else:
		prevTrack = currentTrack
	currentTrack = track
	fadeOut(deck)
	pass

onready var flip = true
func _on_Button_pressed():
	if flip:
		transitionSong(Constants.Soundtrack.DOWN_IN_THE_DUMPS)
	else:
		transitionSong(Constants.Soundtrack.CUTE)
	flip = !flip

func _on_fadeOut_tween_completed(object, key):
	if prevTrack != null:
		tracks[prevTrack].position = object.get_playback_position()
		object.stop()
		object.stream = tracks[currentTrack].stream
		object.play(tracks[currentTrack].position)
	fadeIn(object)
