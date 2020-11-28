extends Node

onready var player: Player = preload("res://Player/Player.tscn").instance()

func _ready():
	LocationManager.connect("scene_changed", self,"onSceneChanged")
	
func onSceneChanged(newScene):
	player.position = newScene.coordinates
