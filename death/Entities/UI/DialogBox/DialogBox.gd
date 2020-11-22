extends Panel

var dialog = []
var page = 0


signal dialog_completed

func _init():
	DialogManager.connect("dialog_added", self, "_on_Dialog_added")


func _input(event):
	if visible and event.is_action_pressed("ui_accept"):
		var total = $Text.get_total_character_count()
		if $Text.visible_characters > total:
			if page < dialog.size() - 1:
				print("increment")
				page += 1
				$Text.bbcode_text = dialog[page]
				$Text.visible_characters = 0
			else:
				print("complete")
				emit_signal("dialog_completed")
		else:
			$Text.visible_characters = total
			print("FAST FORWARD")
	

func _ready():
#	$Text.bbcode_text = dialog[page]
	$Text.visible_characters = 0


func _on_Timer_timeout():
	var total = $Text.get_total_character_count()
	if not $Text.visible_characters > total:
		$Text.visible_characters += 1 
		$AudioStreamPlayer.play()
	else:
		$Timer.stop()


func generateDialog(d):
	dialog.push_back(d)
	show()
	$Timer.start(0)

func _on_Dialog_added(d):
	generateDialog(d)
	$Text.bbcode_text = dialog[page]
	$Text.visible_characters = 0
	
	

func _on_DialogBox_dialog_completed():
	hide()
	$Timer.stop()
