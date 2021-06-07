extends Node2D

onready var Global = get_node("/root/Global");  
################## Audio Files ##########################
onready var AlarmBell = preload("res://Resources/Sounds/Pause.wav")
onready var Player = get_node("AudioStreamPlayer2D"); 

onready var RTL_MINUTES_TENS = get_node("TopUI/Colum_Middle/VBoxContainer_ScoreBoard_Middle/HBoxContainer/TIMER_Digit_Minutes_Tens");
onready var RTL_MINUTES_ONES = get_node("TopUI/Colum_Middle/VBoxContainer_ScoreBoard_Middle/HBoxContainer/TIMER_Digit_Minutes_Ones");
onready var RTL_SECONDS_TENS = get_node("TopUI/Colum_Middle/VBoxContainer_ScoreBoard_Middle/HBoxContainer/TIMER_Digit_Seconds_Tens");
onready var RTL_SECONDS_ONES = get_node("TopUI/Colum_Middle/VBoxContainer_ScoreBoard_Middle/HBoxContainer/TIMER_Digit_Seconds_Ones");

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(RTL_MINUTES_TENS);
	#print(RTL_MINUTES_ONES);
	#print(RTL_SECONDS_TENS);
	#print(RTL_SECONDS_ONES);	
	pass # Replace with function body.
	
func update_timer(): 
	if Global.timesup == 0:
		if Global.seconds < 1:
			Global.minutes = Global.minutes - 1;
			Global.seconds = 59;
		else:
			Global.seconds = Global.seconds -1;
	else:
		Global.seconds = Global.seconds + 1;
	
	var placeholder_a = 0;
	var placeholder_b = 0;	
	var placeholder_c = 0;
	var placeholder_d = 0; 
	
	if Global.minutes > 9:
		placeholder_a = int(Global.minutes/10) 
		placeholder_b = int(Global.minutes - (placeholder_a*10)) 
	else:		 
		placeholder_a = 0; 
		placeholder_b = int(Global.minutes - placeholder_a) 
		
	if Global.seconds > 9:	
		placeholder_c = int(Global.seconds/10) 
		placeholder_d = int(Global.seconds - (placeholder_c*10)) 
	else:
		placeholder_c = 0; 
		placeholder_d = int(Global.seconds - placeholder_c) 
	
	print(placeholder_a , ":" , placeholder_b , ":" , placeholder_c , ":" ,  placeholder_d); 
	RTL_MINUTES_TENS.set_text(str(placeholder_a).pad_zeros(1));
	RTL_MINUTES_ONES.set_text(str(placeholder_b).pad_zeros(1));
	RTL_SECONDS_TENS.set_text(str(placeholder_c).pad_zeros(1)); 
	RTL_SECONDS_ONES.set_text(str(placeholder_d).pad_zeros(1)); 
	
	if(Global.seconds <= 00):
		if(Global.minutes <= 00):
			play_alarm_bell();
			Global.timesup = 1;
			
	if(Global.minutes <=0):
		if(Global.timesup == 1):
			if(Global.seconds >= Global.end_buffer):
				get_tree().quit();
			
	if(Global.minutes <=0):
		if(Global.seconds <=0 ):
			get_tree().quit();
	pass

func _process(delta):
	Global.time += delta
	if Global.time > Global.TIME_PERIOD: 
		update_timer();
		Global.time = 0;
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
