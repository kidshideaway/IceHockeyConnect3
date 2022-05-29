extends Node2D

onready var Global = get_node("/root/Global");  
################## Audio Files ##########################
onready var AlarmBell = preload("res://Resources/Sounds/Pause.wav")
onready var Player = get_node("AudioStreamPlayer2D"); 

onready var TIMER_Digit_Minutes = get_node("TopUI/Colum_Middle/VBoxContainer_ScoreBoard_Middle/HBoxContainer/TIMER_Digit_Minutes");
onready var TIMER_Digit_Seconds = get_node("TopUI/Colum_Middle/VBoxContainer_ScoreBoard_Middle/HBoxContainer/TIMER_Digit_Seconds"); 

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
		
		
	#print(Global.minutes , ":" , Global.seconds); 
	TIMER_Digit_Minutes.set_text(str(Global.minutes).pad_zeros(2));
	TIMER_Digit_Seconds.set_text(str(Global.seconds).pad_zeros(2)); 
	
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
