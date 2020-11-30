# Describes a generic slice of state...
# All State Slices will have these values.

extends Node
class_name VoiceSlice

var resources = Dictionary()

# path to a resource
var resource_path: String = "res://db/Resources/Voice"
var resource_type: int =  Constants.ResourceTypes.VOICE
var walkIgnore: Array = []


# func _init(path: String, type: int, ignoreList: PoolStringArray = []):
# 	resource_path = "res://db/Resources/%s" % path
# 	resource_type = type
# 	walkIgnore = ignoreList
# 	print_debug("    ->  Slice %s initialized: %s, %s " % [path, resource_path, type], ignoreList)

func _ready():
	print_debug("Loading resources at: ", resource_path)
	_loadResources()
	
#	print("res: ", fetch("Default").sample)

func handleDirectory(path: String, skipNav: bool, fileHandler, dirHandler, details: Dictionary):
	print("handle directory: ", path)
	if not walkIgnore.has(path.get_file()):
		FileSystem.dirWalk(path, skipNav, fileHandler, dirHandler, details)
		
func fileHandler(name: String, path: String, _details: Dictionary):
	print("handle file: ", name)
	var targetKey = name.get_basename()
	var fileIsParentFolderName: bool = path.get_base_dir().get_file() == targetKey
	if path.get_extension() == "tres" and fileIsParentFolderName:
		var newVoice = load(path)
		resources[targetKey] = newVoice

var fh = funcref(self, "fileHandler")
var dh = funcref(self, "handleDirectory")

# fucntion for loading resources...
func _loadResources():
	FileSystem.dirWalk(resource_path, true, fh, dh)
	pass

func fetch(key: String) -> Voice:
	print("resources: ", resources)
	if resources[key]:
		print("fetch: ", resources[key])
	return resources[key] if resources.has(key) else null
