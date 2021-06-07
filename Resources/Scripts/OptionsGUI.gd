extends Control


onready var Global = get_node("/root/Global");  

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
	
func build_card():
	pass;
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton3_pressed():
	pass # Replace with function body.


func _on_TextureButton2_pressed():
	pass # Replace with function body.


func _on_TextureButton_pressed():
	pass # Replace with function body.


func make_visible():  	
	self.show();	
	var check = self.check_visiblity(); 
	if(check == 1):
		print("OptionsGUI set to show. ");
	else:
		get_node("YSort/GUI/YSort/OptionsGUI").show();
		var check2 = self.check_visiblity(); 
		if(check2 == 1):
			print("OptionsGUI set to show. ");
		
func make_invisible(): 
	self.hide();	
	var check = self.check_visiblity(); 
	if(check == 0):
		print("OptionsGUI set to hide. ");
	else:
		get_node("YSort/GUI/YSort/OptionsGUI").hide();
		var check2 = self.check_visiblity(); 
		if(check2 == 0):
			print("OptionsGUI set to hide. ");

func check_visiblity():
	if self.visible:
		return(1)
	else:
		return(0)
	pass;
