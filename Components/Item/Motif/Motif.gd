extends Item
class_name Motif

export(AudioStreamSample) var sound

var player = AudioStreamPlayer.new()

func _init():
	type = ItemInterface.ItemTypes.MOTIF
	
# fetch global context MotifPlayer to play sound instead...
func play():
	player.stream = sound
	player.play()
	pass

func stop():
	player.stop()
	
func rewind():
	player.seek(0)
	
	
# maybe make a disposal function?
