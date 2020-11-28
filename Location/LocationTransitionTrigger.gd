extends Area2D

export(Constants.NavigatorLocations) var location
export(float) var delay = 0.5
export(Vector2) var coordinates = Vector2(0,0)

func _on_LocationTransition_body_entered(body):
	if body is Player:
		LocationManager.transitionTo(LocationNavigator.new(location, coordinates, delay))

