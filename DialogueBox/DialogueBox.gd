extends Panel
class_name DialogueBox


export var enterAudio: AudioStreamSample
export var exitAudio: AudioStreamSample


const progressionIndicator: PackedScene = preload("res://DialogueBox/DialogueProgressionIndicator.tscn")

signal dialogue_completed

#export var wait_time: float = 0.05
#export var dialogue: Array = [ 
#	{ 
#		text = "this is the default text... congrats you've found a bug." 
#	}
#]

export(Array, Resource) var dialogues = [
	Dialogue.new("this is the default text... congrats on finding it!"),
	Dialogue.new("this second sentence is to test the progression animator")
]


export var page: int = 0
var currentDialogue: Dialogue

export var enter_animation: Dictionary = { "name": "slide_up", "speed": 1 }
export var exit_animation: Dictionary = { "name": "slide_down", "speed": 1 }

func animate(anim_name: String, speed: float):
	$DialogueAnimator.playback_speed = speed
	$DialogueAnimator.play(anim_name)

func summonDialogueBox():
	animate(enter_animation.name, enter_animation.speed)

func dismissDialogueBox():
	animate(exit_animation.name, exit_animation.speed)

func spawnProgressionIndicator():
	if $DialoguePregressionIndicator:
		print("we've got an indicator already...")
	else:
		var node = progressionIndicator.instance()
		add_child(node)

func reset():
	$DialogueWrapper/Dialogue.visible_characters = 0
	if $DialogueProgressionIndicator:
		$DialogueProgressionIndicator.confirm()
	
func updateCurrentDialogue():
	currentDialogue = dialogues[page]
	$DialogueTimer.wait_time = currentDialogue.text_speed
	$DialogueWrapper/Dialogue.bbcode_text = currentDialogue.text
#	print("correct: ", currentDialogue.voice)
	# $DialogueVoicebox.stream = currentDialogue.voice.sample

func _input(event):
	var total = $DialogueWrapper/Dialogue.get_total_character_count()
	if visible and event.is_action_pressed("confirm"):
		if $DialogueWrapper/Dialogue.visible_characters > total:
			if page < dialogues.size() - 1:
				page += 1
				updateCurrentDialogue()
				reset()
				$DialogueTimer.start(0)
				if $Control/Sprite:
					$Control/Sprite.play()
			else:
				print("complete")
				dismissDialogueBox()
	elif !$DialogueTimer.is_stopped() and event.is_action_pressed("cancel"):
		$DialogueWrapper/Dialogue.visible_characters = total


func _ready():
#	if $Control/Sprite:
#		$DialogueWrapper/Dialogue.margin_left += $Control.rect_size[0]
	reset()
	updateCurrentDialogue()
	summonDialogueBox()



func _on_DialogueTimer_timeout():
	var total = $DialogueWrapper/Dialogue.get_total_character_count()
	if not $DialogueWrapper/Dialogue.visible_characters > total:
		if $DialogueWrapper/Dialogue.bbcode_text.length() < $DialogueWrapper/Dialogue.visible_characters:
			print("going: ", $DialogueWrapper/Dialogue.bbcode_text[$DialogueWrapper/Dialogue.visible_characters])
		$DialogueWrapper/Dialogue.visible_characters += 1 
		$DialogueVoicebox.play()
	else:
		print("done with sentence")
		$DialogueTimer.stop()
		spawnProgressionIndicator()
		if $Control/Sprite:
			$Control/Sprite.stop()


func _on_DialogueBox_visibility_changed():
	if !visible:
		print("it's time to die...")


func _on_DialogueAnimator_animation_finished(anim_name):
	match anim_name:
		enter_animation.name:
			$DialogueTimer.start(0)
			if $Control/Sprite:
				$Control/Sprite.play()
			else:
				print("no sprite detected")
		exit_animation.name:
			emit_signal("dialogue_completed")

func _on_DialogueBox_dialogue_completed():
	queue_free()

