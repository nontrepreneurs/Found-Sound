extends Node

func handleDirectory(path: String, skipNav: bool, fileHandler, dirHandler, details: Dictionary):
	dirWalk(path, skipNav, fileHandler, dirHandler, details)

func handleFile(_name: String, path: String, _details: Dictionary):
	print("handling file: {path}".format({"path": path }))

var dh = funcref(self, "handleDirectory")
var fh = funcref(self, "handleFile")

func dirWalk(path: String, skipNav: bool, fileHandler = fh, dirHandler = dh, details = {}):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(skipNav) #skip navigation . and ..
		var file = dir.get_next()
		while file:
			var absolutePath = "{path}/{file}".format(
				{
					"path": path,
					"file": file
				}
			)
			if dir.current_is_dir():
					dirHandler.call_func(absolutePath, skipNav, fileHandler, dirHandler, details)
			else:
				fileHandler.call_func(file, absolutePath, details)
			file = dir.get_next()
	else:
		printerr("ItemDatabase.dirWalk(): path error")
