extends KinematicBody2D

export var play_cowbell: Resource = null

var listener: SoundListener = null
var player: AnimationPlayer = null

const PLAY_COWBELL_ANIMATION = "PlayCowbell"
const ON_PLAY_COWBELL_CHANGED = "on_play_cowbell_changed"

func _ready():
	assert(play_cowbell, "ERROR: BipedalCow requires tidbit property.")

	listener = $SoundListener
	assert(listener, "ERROR: BipedalCow is missing SoundListener child.")

	player = $AnimationPlayer
	assert(player, "ERROR: BipedalCow is missing AnimationPlayer child.")
	if (play_cowbell.value):
		start_dancing()
	play_cowbell.connect(play_cowbell.VALUE_CHANGED_SIGNAL, self, ON_PLAY_COWBELL_CHANGED)

func on_play_cowbell_changed(new_value: bool) -> void:
	if (new_value):
		start_dancing()

func start_dancing() -> void:
	listener.set_is_listening(false)
	player.stop()
	player.current_animation = PLAY_COWBELL_ANIMATION
	player.play()

