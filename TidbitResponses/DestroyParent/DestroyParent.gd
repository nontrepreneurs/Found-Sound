extends TidbitResponse

func _ready():
	compare_on_change = false
	compare_to_target()

func _on_target_matched() -> void:
	get_node("..").queue_free()