extends Node

var resources = Dictionary()

var itemPath = "res://Components/Item"
func _generateResourcePath(itemType: String):
	return "{itemPath}/{itemType}/Resources".format({
		"itemPath": itemPath,
		"itemType": itemType
	})

var itemConstructorProps = [
	{
		"type": "consumables",
		"path": _generateResourcePath("Consumable")
	},
	{
		"type": "motifs",
		"path": _generateResourcePath("Motif")
	}
]

func fileHandler(name: String, path: String, details: Dictionary):
	if path.get_extension() == "tres":
		resources[details.type][name.to_lower().get_basename()] = load(path) 

var fh = funcref(self, "fileHandler")

func _loadResources():
	for item in itemConstructorProps:
		resources[item.type] = {} # initialize item type objects
		Filesystem.dirWalk(item.path, true, fh, Filesystem.dh, { "type": item.type })


func _fetch_item(type: String, name: String):
	if resources.has(type):
		if resources[type].has(name.to_lower()):
			return resources[type][name.to_lower()]
	return null
	
# convenience methods
func consumable(name: String):
	return _fetch_item("consumables", name)
func motif(name: String):
	return _fetch_item("motifs", name)
	

func _ready():
	_loadResources()
