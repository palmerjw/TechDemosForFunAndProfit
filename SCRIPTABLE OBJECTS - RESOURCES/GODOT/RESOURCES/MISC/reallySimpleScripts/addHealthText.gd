extends RichTextLabel

# TITLE : 
# Functions : 
# Purpose :
# Closely Connected Scripts : 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EnemyPanel_sendHealthToText(currentHealth, maxHealth):
	bbcode_text = "[center]"+String(currentHealth) + "/" + String(maxHealth)+ "[/center]"
