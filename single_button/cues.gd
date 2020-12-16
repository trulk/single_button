extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#----

func _on_Node2D_dubl():
	text = "double press"


func _on_Node2D_hold():
	text = "heald"


func _on_Node2D_cncl():
	text = "long hold"


func _on_Node2D_pres():
	text = "pressed"


func _on_Node2D_rest():
	text = "idle"
