extends Resource
class_name Sample

export var name: String = "" setget set_name, get_name
export var stream: AudioStream = null setget set_stream, get_stream

func set_name(new_name: String) -> void:
	name = new_name

func get_name() -> String:
	return name

func set_stream(new_stream: AudioStream) -> void:
	stream = new_stream

func get_stream() -> AudioStream:
	return stream
