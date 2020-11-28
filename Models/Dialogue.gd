extends Resource
class_name Dialogue

export var text: String = "wow... you've found the default text for a dialogue resource!"
export var text_speed: float = 0.05

export var voice: Resource = preload("res://Resources/Voice/Default/Default.tres")

#export var voice: Dictionary = {
#	"sample": preload("res://Resources/Voice/Default/Default.wav"),
#	pitch = 1
#}

export var skippable: bool = true

func _init(input: String, speed: float = 0.05):
	text =  input
	text_speed = speed















