extends Node
class_name TidbitResponse

export var tidbit: Resource = null
export var target_value: bool = true
export var compare_on_change: bool = false

const ON_TIDBIT_CHANGED = "_on_tidbit_changed"

func _ready():
	assert(tidbit, "ERROR: TidbitResponse node is missing tidbit property.")
	tidbit.connect(tidbit.VALUE_CHANGED_SIGNAL, self, ON_TIDBIT_CHANGED)

func compare_to_target() -> void:
	if tidbit.value == target_value:
		_on_target_matched()

func _on_tidbit_changed(value: bool) -> void:
	if (compare_on_change):
		compare_to_target()
	
func _on_target_matched() -> void:
	pass
