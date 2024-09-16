extends Control

@onready var Global = get_node("/root/Global");  
@onready var GameMenuNode = get_node("/root/GameMenuNode");  
 
# Called when the node enters the scene tree for the first time.
func _ready():
	make_invisible();
	pass # Replace with function body.

func start():	 
	check_visiblity();
	### to do list
	#load db  
	#update display 
	
	pass;

func make_visible():  
	self.show();	
	var check = self.check_visiblity(); 
	if(check == 1):
		print("ScoreGUI set to show. ");
	else:
		get_node("ScoreGUINode").show();
		var check2 = self.check_visiblity(); 
		if(check2 == 1):
			print("ScoreGUI set to show. ");	
		
func make_invisible(): 
	self.hide();	
	var check = self.check_visiblity(); 
	if(check == 0):
		print("ScoreGUI set to hide. ");
	else:
		get_node("ScoreGUINode").hide();
		var check2 = self.check_visiblity(); 
		if(check2 == 0):
			print("ScoreGUI set to hide. ");

func check_visiblity(): 
	if self.visible:
		print("Visible!") 
		return(1)
	else:
		print("Not Visible!")
		return(0) 
	#pass;


func _on_ReturnToMenuButton_pressed():
	make_invisible();
	GameMenuNode.make_visible();
	pass # Replace with function body.
