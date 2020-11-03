extends Resource
class_name Inventory

signal change_equipment(invChange)
signal change_motifs(invChange)
signal change_consumables(invChange)

export(Dictionary) var consumables = {}
export(Dictionary) var motifs = {}
export(Dictionary) var equipment = {}

export(Dictionary) var items = {
	"equipment": equipment,
	"motifs": motifs,
	"consumables": consumables
}

func _notify_change(cat_key: String, item_key: String):
	emit_signal(determine_signal("change", cat_key), [
		{
			"cat_key": cat_key,
			"item_key": item_key 
		}
	])
	
	
func determine_signal(prefix: String, cat_key: String):
	var fmt = "{pfx}_{str}"
	return fmt.format(prefix, cat_key) 

# adds items to inventory and communicate 
# via signal based on what has changed
# returns the previous item or null
func add_item(cat_key: String, item_key:String, item: Resource):
	var prevItem = null
	if items[cat_key].has(item_key):
		prevItem = items[cat_key][item_key]
		
	items[cat_key][item_key] = item
	
	_notify_change(cat_key, item_key)
	
	return prevItem

# remove item if it exists
# communicate what has changed
# returns previous item or null
func remove_item(cat_key: String, item_key:String):
	var prevItem = null
	if items[cat_key].has(item_key):
		
		prevItem = items[cat_key][item_key]
		items[cat_key].remove(item_key)
		
		_notify_change(cat_key, item_key)
		
	return prevItem
	

func categoryToArray(cat_key:String):
	return items[cat_key].values()
	
