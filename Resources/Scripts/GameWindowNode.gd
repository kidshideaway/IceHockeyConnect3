extends Node2D
@onready var parent = get_node("/root");  
@onready var Global = get_node("/root/Global");  
@onready var TitleScreenNode = get_node("/root/TitleScreenNode");  
@onready var GameWindowNode = get_node("/root/GameWindowNode");  
@onready var GameMenuNode = get_node("/root/GameMenuNode"); 
@onready var OptionsGUINode = get_node("/root/OptionsGUINode"); 
@onready var ScoreGUINode = get_node("/root/ScoreGUINode"); 

#@export var parent =  get_tree().get_root().get_node("GameWindowNode") 
#@export var Global = parent.get_node("Global");  
#@export var GameWindowNode = parent.get_node("GameWindowNode"); 
#@export var OptionsGUINode = parent.get_node("OptionsGUINode");  
#@export var GameMenuNode = parent.get_node("GameMenuNode");  
#@export var ScoreGUINode = parent.get_node("ScoreGUINode"); 

################## Audio Files ##########################
@export var AlarmBell = preload("res://Resources/Sounds/Pause.wav")
@export var Player = 0 
@export var TIMER_Digit_Minutes = "0";
@onready var VIZ_TIMER_D_M = get_node("TopUI/Column_Middle/VBoxContainer_ScoreBoard_Middle/HBoxContainer/TIMER_Digit_Minutes")
@export var TIMER_Digit_Seconds = "0";
@onready var VIZ_TIMER_D_S = get_node("TopUI/Column_Middle/VBoxContainer_ScoreBoard_Middle/HBoxContainer/TIMER_Digit_Seconds")


# Called when the node enters the scene tree for the first time.
func _ready(): 
	print("parent", parent) 	
	var Player2 = parent.get_node("GameWindowNode/AudioStreamPlayer2D"); 
	if Player2 != null:
		Player = Player2	 
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
		VIZ_TIMER_D_M.set_text(Global.minutes)
		VIZ_TIMER_D_S.set_text(Global.seconds)
		print("Timer: ",TIMER_Digit_Minutes , ":" , TIMER_Digit_Seconds); 	
	
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
	#pass;


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
