extends Component
class_name Inventory

signal change_generic(invChange)
#signal change_equipment(invChange)
signal change_motifs(invChange)
signal change_consumables(invChange)

signal itemExistsFailure(item)
signal itemQuantityExceeded(item)
signal itemTypeUnknown(item, type)

func _init():
	component = {
		"generic": {},
		"equipment": {},
		"motifs": {},
		"consumables": {}
	} 


func _itemExistenceGuard(item: Item, type: String):
	if not component[type].has(item.name):
		return true
	else:
		printerr("Inventory._itemExistenceGuard(): singleton item already exists")
		emit_signal("itemExistsFailure", item) # you already have this item...
		return false
		
func _itemTypeGuard(item: Item, type: String):
	if component.keys().has(type):
		return _itemExistenceGuard(item, type)
	else:
		printerr("Inventory.addItem(): unknown item type - {type}".format({ "type": type } ))
		emit_signal("itemTypeUnknown", item, type)
		return false
	
func addGeneric(item: Item, type: String):
	if _itemTypeGuard(item, type):
		component[type][item.name] = item
	

func addConsumable(item: Consumable, quantity: int):
	var norm = 0
	var max_stack = item.max_stack_size if item.stackable else 1

	var consumables = component["consumables"]
	
	if consumables.has(item.name) and consumables[item.name].has("count"):
		var count = consumables[item.name].count
		norm = count + quantity
	else:
		norm += quantity
		
	if norm > max_stack:
		norm = max_stack
		printerr("Inventory._processConsumableItem(): stack of items exceeded. normalizing...")
		emit_signal("itemQuantityExceeded", item)

	component["consumables"][item.name] = {
		"item": item,
		"count": norm
	}	


func addItem(type: String, name: String, quantity: int = 1):	
	if quantity <= 0:
		printerr("Inventory.addItem(): cannot add a negative number.")
		return
	
	var item = ItemState._fetch_item(type, name)
	var types = ItemInterface.ItemTypes
	var signalPayload = {"type": type, "name": name }
	if item:
		match item.type:
			types.CONSUMABLE:
				addConsumable(item, quantity)
				emit_signal("change_consumables", signalPayload)
			types.GENERIC:
				addGeneric(item, type)
				emit_signal("change_generic", signalPayload)
			types.MOTIF:
				addGeneric(item, type)
				emit_signal("change_motifs", signalPayload)
			_:
				printerr("Inventory.addItem(): item did not match any types")
				return
		emit_signal("component_changed", self)
	else:
		printerr("Inventory.addItem(): could not find item")


func getItem(name: String):
	print(name)
	return ItemState._fetch_item("motifs", name)
