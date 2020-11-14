extends Item
class_name Motif

export(AudioStreamSample) var sound

var player = AudioStreamPlayer.new()

func _init():
	type = ItemInterface.ItemTypes.MOTIF

	
func onUse():
	GameManager.playSound(sound) 
	DialogManager.queueDialog(description)
# maybe make a disposal function?
