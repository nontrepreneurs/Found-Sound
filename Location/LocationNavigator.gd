extends Resource
class_name LocationNavigator

export(Constants.NavigatorLocations) var location = Constants.NavigatorLocations.HOMESTEAD
export var coordinates: Vector2 = Vector2(0,0)
export var delay: float = 0.5

func _init(loc: int, coords: Vector2, del: float = 0.5):
	location = loc
	coordinates = coords
	delay = del



