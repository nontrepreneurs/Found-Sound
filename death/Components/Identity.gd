extends Component
class_name Identity

func setCharacter(name:String):
	print("CHAR SET: ", name)
	var chara = CharacterState._fetch_character(name)
	if chara:
		setComponent(chara)
	else:
		printerr("Identity.setCharacter(): character not found")
