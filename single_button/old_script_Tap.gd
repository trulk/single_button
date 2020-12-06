#func _process(delta):
#	pass
signal click

signal hold

signal idle_b

signal short

func _on_Button_button_down():
	if $Button/UpT.time_left > 1.4:
		emit_signal("short")
	$Button/UpT.stop()
	$Button/DownT.start()



func _on_Button_button_up():
	if $Button/DownT.time_left > 2.9:
		emit_signal("click")
	$Button/DownT.stop()
	$Button/UpT.start()
	if $Button/UpT.time_left < 0.1:
		emit_signal("idle_b")



# timers don't seem to timeout using
# start in another funtion
func _on_DownT_timeout():
	emit_signal("hold")



func _on_UpT_timeout():
	pass # Replace with function body.
