extends Node2D

onready var Global = get_node("/root/Global");  
onready var TitleScreenNode = get_node("/root/TitleScreenNode");  
onready var GameWindowNode = get_node("/root/GameWindowNode");  
onready var GameMenuNode = get_node("/root/GameMenuNode"); 
onready var OptionsGUINode = get_node("/root/OptionsGUINode"); 
onready var ScoreGUINode = get_node("/root/ScoreGUINode"); 
 
# Called when the node enters the scene tree for the first time.
func _ready():
	make_visible();
	#print(Global);
	pass # Replace with function body. 
		
func make_visible():  	
	self.show();	
	var check = self.check_visiblity(); 
	if(check == 1):
		print("TitleScreenNode set to show. ");
	else:
		get_node("TitleScreenNode").show();
		var check2 = self.check_visiblity(); 
		if(check2 == 1):
			print("TitleScreenNode set to show. ");
		
func make_invisible(): 
	self.hide();	
	var check = self.check_visiblity(); 
	if(check == 0):
		print("TitleScreenNode set to hide. ");
	else:
		get_node("TitleScreenNode").hide();
		var check2 = self.check_visiblity(); 
		if(check2 == 0):
			print("TitleScreenNode set to hide. ");

func check_visiblity():
	if self.visible:
		return(1)
	else:
		return(0)
	pass;
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayButton_pressed():
	make_invisible();
	GameWindowNode.make_visible();
	pass # Replace with function body.


func _on_DraftButton_pressed():
	make_invisible();
	TitleScreenNode.make_visible();
	pass # Replace with function body.


func _on_ScoresButton_pressed():
	make_invisible();
	ScoreGUINode.make_visible();
	pass # Replace with function body.


func _on_SettingsButton_pressed():
	make_invisible();
	OptionsGUINode.make_visible();
	pass # Replace with function body.


func _on_ExitGameButton_pressed(): 
	get_tree().quit();	
	pass # Replace with function body.
	   
