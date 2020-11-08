extends Item
class_name Motif

export(AudioStreamSample) var sound

var player = AudioStreamPlayer2D.new()

func _init():
	type = ItemInterface.ItemTypes.MOTIF
	
func onUse():
	GameManager.playSound(sound)
# maybe make a disposal function?
