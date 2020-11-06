extends Resource
class_name Character

export(String) var name = ""
export(String) var short_name = ""
export(String) var description = ""

export(SpriteFrames) var frames
export(Shape2D) var collision_shape 

export(Array, Dictionary) var dialogue
