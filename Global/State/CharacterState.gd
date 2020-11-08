extends Node

var resources = Dictionary()

var resource_path = "res://Models/Character/Resources" 

var walkIgnore = [
	"assets"
]

func handleDirectory(path: String, skipNav: bool, fileHandler, dirHandler, details: Dictionary):
	if not walkIgnore.has(path.get_file()):
		Filesystem.dirWalk(path, skipNav, fileHandler, dirHandler, details)
	
func fileHandler(name: String, path: String, _details: Dictionary):
	var targetKey = name.get_basename()
	
	var fileIsParentFolderName: bool = path.get_base_dir().get_file() == targetKey
	if path.get_extension() == "tres" and fileIsParentFolderName:
		resources[targetKey] = load(path)

var fh = funcref(self, "fileHandler")
var dh = funcref(self, "handleDirectory")

func _loadResources():
	Filesystem.dirWalk(resource_path, true, fh, dh)

func _ready():
	_loadResources()

func _fetch_character(name: String):
	if resources.has(name):
		return resources[name]
	return null
