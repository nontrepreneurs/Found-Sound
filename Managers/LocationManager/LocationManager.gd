extends CanvasLayer


signal scene_changed(old)

onready var animator = $Animator
onready var screen = $Control/Blackout
onready var timer = $Timer

var homePosition = Vector2(624, 459.803)
onready var currentPosition: Vector2 = homePosition

var area: Dictionary = {
	"Homestead": { 
		"scene": "res://Location/Areas/Homestead.tscn", 
		"FelmarOutskirts": Vector2(618.605, 845)
	},
	"FelmarOutskirts": {
		"scene": "res://Location/Areas/FelmarOutskirts.tscn",
		"Homestead": Vector2(177, 1100)
	},
	
	"FelmarDumps": {
		"scene": "res://Location/Areas/FelmarDumps.tscn",
		"Homestead": Vector2(50, 450)
	}
}

var fadeIn = true
var prevScene = ""
var newScene = ""





func transitionTo(key: String, delay: float = 0.25):
	timer.wait_time = delay
	timer.start()
	#	set current scene...
	prevScene = get_node("/root/Location").areaName
	newScene = key
	
#	assert(get_tree().change_scene(area[newScene].scene) == OK)
#	currentPosition = area[newScene][prevScene]	


func _on_Timer_timeout():
	animator.play("fade")
	pass # Replace with function body.

func _on_Animator_animation_finished(anim_name):
	if fadeIn:
		assert(get_tree().change_scene(area[newScene].scene) == OK)
		currentPosition = area[newScene][prevScene]	
		emit_signal("scene_changed", prevScene, newScene)
	fadeIn = !fadeIn





func _on_LocationManager_scene_changed(old, new):	
		animator.play_backwards("fade")

	
	

