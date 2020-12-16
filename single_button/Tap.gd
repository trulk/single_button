extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var sit # relates to pushed possition phases
var hop # relates to relese times (increment?)
#var score
signal pres
signal dubl
signal hold
signal rest
signal cncl # used for long press as cancel option 


#signal click
#signal idle_b
#signal short #releys on hop
#signal shorthold # relys on sit

var b_in #used to indicate binary input state.
#		 if button in and out in this case

# Called when the node enters the scene tree for the first time.
func _ready(): # set opening state
		hop = 0
		sit = 0
		get_node("sir2").start() # use '$' insted

# may need to use delta funtions in the future implementations


# funtions moved to parent of input
func _on_vbn_button_down(): # as connect to binary in
	b_in = true
	# start pushed timers and stop relesed ones
	$sip1.start()
	$sip2.start()
	# sit = 1 #+# variable currently not needed?
	$sir1.stop()
	$sir2.stop()


func _on_vbn_button_up(): 
	b_in = false
	if hop >= 1: #< if sir1_time_left() > 0
		emit_signal("dubl")
	elif hop == 0 and sit < 1: #< when relesed, and not late  
		emit_signal("pres")
	$sir1.start()
	$sir2.start()
	hop = 1 # because SinceRelese1 is now running (=+ 1?)
	$sip1.stop()
	$sip2.stop()
	sit = 0 

func _on_sir1_timeout():
	# past double click phase/
	hop = 0

func _on_sip1_timeout():
	# past click time/
	emit_signal("hold")
	sit = 2

func _on_sip2_timeout():
	# past hold time/
	emit_signal("cncl")
	$sip1.stop() # sip1 restarts otherwise, (move to sip1_timeout?)
	sit = 3

func _on_sir2_timeout():
	# reached idle time/
	emit_signal("rest")
