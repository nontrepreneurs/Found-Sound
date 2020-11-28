extends Node

export var tidbit_to_set: Resource = null
export var value_to_set_to: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	assert(tidbit_to_set, "ERROR: SetTidbit TidbitResponse requires a tidbit_to_set property.")

func _on_target_matched() -> void:
	tidbit_to_set.value = value_to_set_to
