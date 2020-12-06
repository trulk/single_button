extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Node2D_idle_b():
	text = "Idleing"

func _on_Node2D_click():
	text = "Clicked"


func _on_Node2D_hold():
	text = "Long Hold"



func _on_rek_timeout():
	text = "recked"


func _on_Node2D_short():
	text = "Double"


func _on_Node2D_shorthold():
	text = "Held"
