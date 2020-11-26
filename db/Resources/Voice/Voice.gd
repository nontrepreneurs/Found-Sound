extends Resource
class_name Voice

export(Constants.DialogueTypes) var type = Constants.DialogueTypes.VOCALIZED
export(AudioStreamRandomPitch) var sample = AudioStreamRandomPitch.new()
export var volume: float = 0
