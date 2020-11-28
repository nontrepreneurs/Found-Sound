extends TidbitResponse

export var animation_name: String = ""

var player: AnimationPlayer = null

func _ready():
	player = get_node("../AnimationPlayer")
	assert(player, "ERROR: StartAnimation requires an AnimationPlayer sibling.")

	assert(animation_name != "", "ERROR: StartAnimation requires an animation name.")

	compare_to_target()
	
func _on_target_matched() -> void:
	player.stop()
	player.current_animation = animation_name
	player.play()
