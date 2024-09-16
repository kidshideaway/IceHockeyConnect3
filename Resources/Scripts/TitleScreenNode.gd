extends Control 

@onready var Global = get_node("/root/Global");   
@onready var GameWindowNode = get_node("/root/GameWindowNode");   
@onready var OptionsGUINode = get_node("/root/OptionsGUINode");  
@onready var GameMenuNode = get_node("/root/GameMenuNode");  
@onready var ScoreGUINode = get_node("/root/ScoreGUINode"); 


func _ready():
	make_visible();
	GameWindowNode.make_invisible();	
	OptionsGUINode.make_invisible();
	GameMenuNode.make_invisible();
	ScoreGUINode.make_invisible();
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
	#pass;

func _on_TextureButton_Start_pressed():
	print("Hello Word: Start Game")
	make_invisible();
	GameWindowNode.make_visible();
	pass # Replace with function body.
