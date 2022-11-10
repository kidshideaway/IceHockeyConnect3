extends Node2D

onready var parent =  get_tree().get_root().get_node(".") 
onready var Global = parent.get_node("Global");  
onready var GameWindowNode = parent.get_node("GameWindowNode"); 
onready var OptionsGUINode = parent.get_node("OptionsGUINode");  
onready var GameMenuNode = parent.get_node("GameMenuNode");  
onready var ScoreGUINode = parent.get_node("ScoreGUINode"); 

################## Audio Files ##########################
onready var AlarmBell = preload("res://Resources/Sounds/Pause.wav")
onready var Player = 0 
onready var TIMER_Digit_Minutes = 0
onready var TIMER_Digit_Seconds = 0

# Called when the node enters the scene tree for the first time.
func _ready(): 
	print("parent", parent) 	
		
	var TEST_GameWindowNode = parent.get_node("GameWindowNode")
	print("TEST_GameWindowNode", TEST_GameWindowNode)
	 
	var TEST_TopUI = TEST_GameWindowNode.get_node("TopUI")
	print("TEST_TopUI", TEST_TopUI)	
	
	var TEST_Player1 = TEST_GameWindowNode.get_node("AudioStreamPlayer2D"); 
	if TEST_Player1 != null:
		Player = TEST_Player1

	var Player2 = parent.get_node("GameWindowNode/AudioStreamPlayer2D"); 
	if Player2 != null:
		Player = Player2	 
		
	var TEST_Colum_Middle = TEST_TopUI.get_node("Column_Middle")
	print("TEST_Colum_Middle", TEST_Colum_Middle)
	
	var TEST_Column_Left = TEST_TopUI.get_node("Column_Left")
	print("TEST_Column_Left", TEST_Column_Left)
	
	var TEST_Column_Right = TEST_TopUI.get_node("Column_Right")
	print("TEST_Column_Right", TEST_Column_Right)
	
	var TEST_VBoxContainer = TEST_Colum_Middle.get_node("VBoxContainer_ScoreBoard_Middle")
	print("TEST_VBoxContainer", TEST_VBoxContainer)
	
	var TEST_HBoxContainer = TEST_VBoxContainer.get_node("HBoxContainer") 
	print("TEST_HBoxContainer", TEST_HBoxContainer)
	
	TIMER_Digit_Minutes = TEST_HBoxContainer.get_node("TIMER_Digit_Minutes");
	print("TIMER_Digit_Minutes", TIMER_Digit_Minutes)
	
	TIMER_Digit_Seconds = TEST_HBoxContainer.get_node("TIMER_Digit_Seconds"); 
	print("TIMER_Digit_Seconds", TIMER_Digit_Seconds)
	 
	pass # Replace with function body.
	
func update_timer(): 
	if check_visiblity() == 1:	
		if Global.timesup == 0:
			if Global.seconds < 1:
				Global.minutes = Global.minutes - 1;
				Global.seconds = 59;
			else:
				Global.seconds = Global.seconds -1;
		else:
			Global.seconds = Global.seconds + 1;
		print("Global Time: ",Global.minutes , ":" , Global.seconds); 
		print("Global Time: ",str(Global.minutes).pad_zeros(2), ":" , str(Global.seconds).pad_zeros(2)); 
		print("Timer: ",TIMER_Digit_Minutes , ":" , TIMER_Digit_Seconds); 
		TIMER_Digit_Minutes.set_text(1);
		TIMER_Digit_Seconds.set_text(1); 
	
		if(Global.seconds <= 00):
			if(Global.minutes <= 00):
				play_alarm_bell();
				Global.timesup = 1;
				
		if(Global.minutes <=0):
			if(Global.timesup == 1):
				if(Global.seconds >= Global.end_buffer):
					make_invisible();
					ScoreGUINode.make_visible();				
					#do nothing, end clock
				
		if(Global.minutes <=0):
			if(Global.seconds <=0 ):
				make_invisible();
				ScoreGUINode.make_visible();
				#do nothing, end clock
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
		
func make_visible():  	
	self.show();	
	var check = self.check_visiblity(); 
	if(check == 1):
		print("GameWindowNode set to show. ");
	else:
		get_node("GameWindowNode").show();
		var check2 = self.check_visiblity(); 
		if(check2 == 1):
			print("GameWindowNode set to show. ");
		
func make_invisible(): 
	self.hide();	
	var check = self.check_visiblity(); 
	if(check == 0):
		print("GameWindowNode set to hide. ");
	else:
		get_node("GameWindowNode").hide();
		var check2 = self.check_visiblity(); 
		if(check2 == 0):
			print("GameWindowNode set to hide. ");

func check_visiblity():
	if self.visible:
		return(1)
	else:
		return(0)
	pass;


func _on_TextureButton_Menu_pressed():
	make_invisible();
	ScoreGUINode.make_visible();
	pass # Replace with function body.


func _on_TextureButton_Exit_pressed():
	get_tree().quit();	
	pass # Replace with function body.


func _on_TextureButton_New_pressed(): 
	var Grid = get_node("Grid")
	Grid._on_TextureButton_pressed();
	pass # Replace with function body.
