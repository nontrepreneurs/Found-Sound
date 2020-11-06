extends Node

signal player_initialized

onready var player = initialize_player()


const InventoryFile = "user://PlayerInventory.tres"
const IdentityFile = "user://PlayerIdentity.tres"


const PlayerProps: Dictionary = {
	inventory = { file = InventoryFile },
	identity =  { file = IdentityFile }
}

func redraw():
	for key in PlayerProps:
		# connect a part of of the PropTree
		player[key].connect(
			"{key}_changed".format({ key = key}), 
			self, 
			"_on_player_{key}_changed".format({ key = key})
		)
		
		var existing = load(PlayerProps[key].file)
		if existing:
			if key == "inventory":
				player.inventory.set_items(existing.get_items())
			elif key == "identity":
				player.identity.set_character(existing.get_character())
		else:
			print("doesnt exist")
			# determine initial values
			

func initialize_player():
	player = get_tree().get_root().get_node("/root/World/Player")
	

	if not player:
		printerr("ya fucked it")
		return
				
	emit_signal("player_initialized", player)
	
	redraw()
	


func _on_player_inventory_changed(inventory):
	ResourceSaver.save(InventoryFile, inventory)
	
func _on_player_identity_changed(identity):
	ResourceSaver.save(IdentityFile, identity)
	
func _ready():
	Directory.new().remove("user://inventory.tres")
