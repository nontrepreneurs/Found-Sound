extends CanvasLayer


signal scene_changed(old)

onready var animator = $Animator
onready var screen = $Control/Blackout
onready var timer = $Timer

var homePosition = Vector2(624, 459.803)

onready var currentLocation: LocationNavigator = LocationNavigator.new(
	Constants.NavigatorLocations.HOMESTEAD,
	homePosition,
	0.5
)


var navigatorMap: Dictionary = {
	Constants.NavigatorLocations.HOMESTEAD: {
		scene = "res://Location/Areas/Homestead/Homestead.tscn",
		name = "Homestead"
	}, 
	Constants.NavigatorLocations.OUTSKIRTS: {
		scene = "res://Location/Areas/Outskirts/Outskirts.tscn",
		name = "Outskirts"
	},
	Constants.NavigatorLocations.TOWN: {
		scene = "res://Location/Areas/Town/Town.tscn",
		name = "Town"
	},
	Constants.NavigatorLocations.TRAIL: {
		scene = "res://Location/Areas/Trail/Trail.tscn",
		name = "Trail"
	},
	Constants.NavigatorLocations.FOREST: {
		scene = "res://Location/Areas/Forest/Forest.tscn",
		name = "Forest"
	},
	Constants.NavigatorLocations.DUMP: {
		scene = "res://Location/Areas/Dumps/Dumps.tscn",
		name = "Dump"
	},
	Constants.NavigatorLocations.WETLANDS: {
		scene = "res://Location/Areas/Wetlands/Wetlands.tscn",
		name = "Wetlands"
	},
	Constants.NavigatorLocations.SECLUDED_STEPPES: {
		scene = "res://Location/Areas/SecludedSteppes/SecludedSteppes.tscn",
		name = "Secluded Steppes"
	}
}

var fadeIn = true

func transitionTo(location: LocationNavigator):
	print("transitioning...")
	currentLocation = location
#	yield(get_tree().create_timer(currentLocation.delay), "timeout")
#	animator.play("fade")
#	yield(animator,"animation_finished")
	assert(get_tree().change_scene(navigatorMap[currentLocation.location].scene) == OK)
#	animator.play_backwards("fade")
#	yield(animator, "animation_finished")
	emit_signal("scene_changed")
#	timer.wait_time = currentLocation.delay
#	timer.start()


#func _on_Timer_timeout():
#	print("timeout")
#	animator.play("fade")
#	pass # Replace with function body.
#
#func _on_Animator_animation_finished(anim_name):
#	print("finished: ", anim_name, " ", fadeIn)
#	if fadeIn:
#		print("location: ",  navigatorMap[currentLocation.location].name)
#		assert(get_tree().change_scene(navigatorMap[currentLocation.location].scene) == OK)
#		animator.play_backwards("fade")
#	else:
#		emit_signal("scene_changed", currentLocation)
#	fadeIn = !fadeIn
#
#
#func _on_LocationManager_scene_changed(old, new):	
#		print("scene has changed")
		

	
	

