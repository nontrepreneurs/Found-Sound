extends Node

signal player_initialized

onready var player = initialize_player()
		
func initialize_player():
	player = get_tree().get_root().get_node("/root/World/Player")
	
	if not player:
		printerr("ya fucked it")
		return
				
	emit_signal("player_initialized", player)
	
	player.inventory.connect("inventory_changed", self, "_on_player_inventory_changed")

	var existing_inventory = load("user://inventory.tres")
	if existing_inventory:
		player.inventory.set_items(existing_inventory.get_items())
	else:
		player.inventory.addItem("motifs", "solemn")

func _on_player_inventory_changed(inventory):
	ResourceSaver.save("user://inventory.tres", inventory)
