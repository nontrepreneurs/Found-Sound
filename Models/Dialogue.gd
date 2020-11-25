extends Resource
class_name Dialogue

export var text: String = "wow... you've found the default text for a dialogue resource!"
export var text_speed: float = 0.05
export var voice: Resource = preload("res://Resources/Voice/Default/Default.tres")
export var skippable: bool = true

func _init(input: String, speed: float = 0.05, voice: Resource = preload("res://Resources/Voice/Default/Default.tres")):
	text =  input
	voice = voice
	text_speed = speed
