extends Control
 
# Called when the node enters the scene tree for the first time.
func _ready():
	make_visible();
	pass # Replace with function body. 
		
func make_visible():  	
	self.show();	
	var check = self.check_visiblity(); 
	if(check == 1):
		print("GameMenu set to show. ");
	else:
		get_node("YSort/GUI/YSort/GameMenu").show();
		var check2 = self.check_visiblity(); 
		if(check2 == 1):
			print("GameMenu set to show. ");
		
func make_invisible(): 
	self.hide();	
	var check = self.check_visiblity(); 
	if(check == 0):
		print("GameMenu set to hide. ");
	else:
		get_node("YSort/GUI/YSort/GameMenu").hide();
		var check2 = self.check_visiblity(); 
		if(check2 == 0):
			print("GameMenu set to hide. ");


func check_visiblity():
	if self.visible:
		return(1)
	else:
		return(0)
	pass;
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
