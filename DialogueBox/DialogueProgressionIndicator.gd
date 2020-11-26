extends TextureRect

func _ready():
	$ProgressionAnimator.play("blink")

func confirm():
	$AudioStreamPlayer.play(0)

func _on_AudioStreamPlayer_finished():
	queue_free()
