extends TidbitResponse

export var compare_on_ready: bool = false

func _ready():
	if (compare_on_ready):
		compare_to_target()

func _on_target_matched() -> void:
	get_node("..").queue_free()
