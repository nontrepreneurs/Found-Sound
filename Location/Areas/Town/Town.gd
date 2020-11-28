extends Location



var inside = Vector2(1, 1)
var outside = Vector2(0.75,0.75)

onready var camera = $Map/Player/Camera
onready var isInside = false

func _physics_process(delta):
	if camera:		
		if isInside:
			camera.zoom = lerp(camera.zoom, inside, 1 * delta) 
		else:
			camera.zoom = lerp(camera.zoom, outside, 1 * delta) 


func _on_ZoomArea_body_entered(body):
	if body == player:
		isInside = true


func _on_ZoomArea_body_exited(body):
	if body == player:
		isInside = false
