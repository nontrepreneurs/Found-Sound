extends Resource
class_name Component

signal component_changed

var component = null setget setComponent, getComponent

func getComponent():
	return component
	
func setComponent(comp):
	component = comp
	if component != null: 
		emit_signal("component_changed", self)
