extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	if sit == true:
#		emit_signal("shorthold")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
signal click
signal hold
signal idle_b
signal short #releys on hop
signal shorthold # relys on sit

var b_in
var hop
var sit

func _on_Button_button_down():
	if $Button/UpT.time_left > 1.4 and sit != true:
		hop = true
		sit = false
	$Button/UpT.stop()
	$Button/DownT.start()
	if $Button/DownT.time_left < 1.4:
		sit = true
		emit_signal("shorthold")
		hop = false


func _on_Button_button_up():
	b_in = false
	if $Button/DownT.time_left > 2.9:
		if hop == false:
			emit_signal("click")
		if hop == true:
			emit_signal("short")
	$Button/DownT.stop()
	$Button/UpT.start()




# timers don't seem to timeout using
# start in another funtion
func _on_DownT_timeout():
	emit_signal("hold")
	sit = false
	hop = false
	b_in = true

func _on_UpT_timeout():
	emit_signal("idle_b")
	hop = false

