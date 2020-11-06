extends Resource
class_name Identity

signal identity_changed

var character = null setget set_character, get_character


func setCharacter(name:String):
	var chara = CharacterState._fetch_character(name)
	if chara:
		set_character(chara)
	else:
		printerr("Identity.setCharacter(): character not found")

func get_character():
	return character
	
func set_character(chara):
	character = chara
	emit_signal("identity_changed", self)
