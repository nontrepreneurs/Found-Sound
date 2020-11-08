extends Panel

func _init():
	GameManager.connect(
		"player_initialized", self, "_on_player_initialized")

func _ready():
	print("PANEL READY")


func _on_player_initialized(player):
	print("INIT")
	player.inventory.connect("component_changed", self, "_on_player_inventory_changed")

func _on_player_inventory_changed(inventory: Inventory):
	
	var grid: GridContainer = $GridContainer
	
	for itemType in grid.get_children():
		itemType.queue_free()
	
	var inv = inventory.getComponent()
	
	for itemType in inv:

		var itemCategory = inv[itemType].values()
		if itemCategory.size() > 0:
			var itemList: ItemList = ItemList.new()
			
			var typeLabel = Label.new()
			typeLabel.text = "%s:" % [itemType]	
			itemList.add_child(typeLabel)
			
			for item in itemCategory:
				var itemLabel = Label.new()
				if itemType == "consumables":
					itemLabel.text = "%s x%d" % [item.item.name, item.count]
				else:
					itemLabel.text = "%s" % [item.name]
#				itemList.add_child(itemLabel)
				itemList.add_item(itemLabel.text, null, true)

			grid.add_child(itemList)
			

		
