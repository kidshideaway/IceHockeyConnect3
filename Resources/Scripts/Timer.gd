extends Node2D

var timer

func _init():
	timer = Timer.new();
	add_child(timer);
	pass;
	
func start(seconds):
	timer.autostart = true;
	timer.wait_time = seconds;
	timer.connect("timeout", self, "_timeout");
	return(1);

func _timeout(): 
	pass;
	
