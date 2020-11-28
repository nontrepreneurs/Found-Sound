extends Resource
class_name Tidbit

const VALUE_CHANGED_SIGNAL = "value_changed"
signal value_changed(new_value)

export var starting_value: bool = false

var value: bool setget set_value, get_value
var registered: bool = false

func register() -> void:
	assert(!registered, "ERROR: Tidbit cannot register twice!")
	registered = true
	TidbitManager.register(self)

func set_value(new_val: bool) -> void:
	if !registered:
		register()
	value = new_val
	emit_signal(VALUE_CHANGED_SIGNAL, value)

func get_value() -> bool:
	if (!registered):
		register()
		value = starting_value
	return value
