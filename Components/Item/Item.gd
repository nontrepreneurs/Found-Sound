extends Resource
class_name Item

export(String) var name = ""
export(String) var short_name = ""
export(String) var description = ""
export var texture : Texture


export(ItemInterface.ItemTypes) var type = ItemInterface.ItemTypes.GENERIC
