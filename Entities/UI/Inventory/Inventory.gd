extends Panel

onready var motifList: ItemList = ItemList.new().set_name("MotifList")

func _init():
	GameManager.connect(
		"player_initialized", self, "_on_player_initialized")
	

func _ready():
	print("PANEL READY")
	add_child(motifList)

var menuVisible = false;
func _input(event):
	if event.is_action_pressed("GameMenu"):
		menuVisible = !menuVisible
		if menuVisible:
			pass
		else:
			pass



func _on_player_initialized(player):
	player.inventory.connect("component_changed", self, "_on_player_inventory_changed")


var inventory: Inventory

var menuStack = []

func _on_player_inventory_changed(inv: Inventory):
	var i = inv.getComponent()	
	inventory = inv
	$ItemList.clear()
	
	var substack = []
	for itemType in i:
		var itemCategory = i[itemType].values()
		if itemCategory.size() > 0:
			var inventoryGroup = "%s" % [itemType.capitalize()]	
			$ItemList.add_item(inventoryGroup)
			substack.push_back(inventoryGroup)
	menuStack.push_back(substack)


func _on_InventoryButton_toggled(button_pressed):
	if button_pressed:
		show()
	else:
		hide()
	pass # Replace with function body.


func renderFromArray(array):
	$ItemList.clear()
	
	var substack = []
	for item in array:
		$ItemList.add_item(item)
		substack.push_back(item)
		
	menuStack.push_back(substack)

func renderInventoryList(inventoryTopic: String):
	$ItemList.clear()
	
	$ItemList.add_item("<< Back", null, true)
	var inv = inventory.getComponent()
	for item in inv[inventoryTopic].values():
		var text
		if inventoryTopic == "consumables":
			text = "%s x %d" % [item.item.name, item.count]
		else:
			text = "%s" % [item.name]

		$ItemList.add_item(text, null, true)

func _on_ItemList_item_activated(index):
	var inventoryTopic = $ItemList.get_item_text(index)
	var isTopic = inventory.getComponent().keys().has(inventoryTopic.to_lower())
	
	if isTopic:
		renderInventoryList(inventoryTopic.to_lower())
	elif inventoryTopic == "<< Back":
		renderFromArray(menuStack.pop_back())
	else:
		var item: Item = inventory.getItem(inventoryTopic)
		if item != null and item.has_method("onUse"):
			item.onUse()
	



