extends Item
class_name Consumable

export var stackable : bool = false;
export var max_stack_size : int = 1;

func _init():
	type = ItemInterface.ItemTypes.CONSUMABLE
