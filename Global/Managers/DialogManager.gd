extends Node

signal dialog_added(dialog)

func queueDialog(dialog):
	emit_signal("dialog_added", dialog)
