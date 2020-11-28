extends Resource
class_name VoiceOld

export(Constants.DialogueTypes) var type = Constants.DialogueTypes.VOCALIZED
export(AudioStreamRandomPitch) var sample = AudioStreamRandomPitch.new()
export var volume: float = 0


func _init(type: int, stream: AudioStreamSample, pitch: float = 1, volume: int = 0):
	type = type
	sample.audio_stream = stream
	sample.random_pitch = pitch
	volume = volume
