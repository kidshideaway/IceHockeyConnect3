extends Node2D

onready var Global = get_node("/root/Global");  
################## Audio Files ##########################
onready var AlarmBell = preload("res://Resources/Sounds/Pause.wav")
onready var Player = get_node("AudioStreamPlayer2D"); 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func update_timer(): 
	if timesup == 0:
		if seconds < 1:
			minutes = minutes - 1;
			seconds = 59;
		else:
			seconds = seconds -1;
	else:
		seconds = seconds + 1;
		 
	var placeholder = int(minutes/10)
	RTL_MINUTES_TENS.set_text(str(placeholder).pad_zeros(1));
	placeholder = int(minutes - placeholder)
	RTL_MINUTES_ONES.set_text(str(placeholder).pad_zeros(1));
	placeholder = int(seconds/10)
	RTL_SECONDS_TENS.set_text(str(seconds).pad_zeros(1)); 
	placeholder = int(seconds - placeholder)
	RTL_SECONDS_ONES.set_text(str(placeholder).pad_zeros(1)); 

	if(seconds <= 00):
		if(minutes <= 00):
			play_alarm_bell();
			timesup = 1;
			
	if(minutes <=0):
		if(timesup == 1):
			if(seconds >= end_buffer):
				get_tree().quit();
	pass

func _process(delta):
	time += delta
	if time > TIME_PERIOD: 
		update_timer();
		time = 0;
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_Q:
			get_tree().quit();

func play_alarm_bell(): 
	Player.stream = AlarmBell
	Player.play()

func _on_TextureButton_pressed():
	var Grid = get_node("Grid")
	Grid._on_TextureButton_pressed();
	pass # Replace with function body.
