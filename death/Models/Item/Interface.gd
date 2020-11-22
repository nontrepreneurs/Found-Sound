extends Node

enum ItemTypes {
	GENERIC,
	CONSUMABLE,
	MOTIF,
	EQUIPMENT
}

func isGeneric(type: int) -> bool:
	return type == ItemTypes.GENERIC

func isConsumable(type: int) -> bool:
	return type == ItemTypes.CONSUMABLE

func isMotif(type: int) -> bool:
	return type == ItemTypes.MOTIF
	
func isEquipment(type: int) -> bool:
	return type == ItemTypes.EQUIPMENT

func determineType(type: int) -> String:
	match type:
		ItemTypes.GENERIC:
			return "generic"
		ItemTypes.CONSUMABLE:
			return "consumable"
		ItemTypes.MOTIF:
			return "motif"
		ItemTypes.EQUIPMENT:
			return "equipment"
		_:
			return "unknown"
	
