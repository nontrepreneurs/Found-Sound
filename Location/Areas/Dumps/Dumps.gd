extends Location


func _ready():
	LocationManager.connect("scene_changed", self, "onSceneChanged")

func onSceneChanged(old):
	print("i just came from: ", old)
