extends Resource
class_name EnemeyMove

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Array, PackedScene) var moveSet

# warning-ignore:shadowed_variable
# Called when the node enters the scene tree for the first time.
func _init(moveSet = []):
	self.moveSet = moveSet
