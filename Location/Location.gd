extends Node2D
class_name Location
export var areaName: String = ""

onready var player = $Map/Player

func _ready():
	player.position = LocationManager.currentPosition
	print(player.position)
