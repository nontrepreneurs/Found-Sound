extends Node

var tidbits: Dictionary = {}

func register(some_tidbit: Resource):
	var key = some_tidbit.resource_path
	assert(!tidbits.has(key), "ERROR: TIDBIT IS TRYING TO REGISTER TWICE.")
	tidbits[key] = some_tidbit
