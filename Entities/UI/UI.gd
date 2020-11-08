extends CanvasLayer


onready var player: Player = get_node("../Player")

func _input(event):
	if event.is_action_pressed("GameMenu"):

		if !$GameMenu.visible:
			$GameMenu.popup_centered()
			player.canMove = false
		else:
			$GameMenu.hide()
			player.canMove = true


func _on_Exit_pressed():
	$GameMenu.hide()
	player.canMove = true
