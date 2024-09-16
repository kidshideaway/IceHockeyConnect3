extends Node2D
 
func _ready():   
	# make the main game window visible
	var node_self = get_node("GameWindowContainer/GameWindow_Node2d");
	if node_self != null:
		make_visible( node_self );
	
	# make the title window visible
	node_self = get_node("GameWindowContainer/Node2D_TitleScreen");
	if node_self != null:
		make_visible( node_self );
	pass;
	 
func _process(delta):
	pass;

func _input(event):
	pass;
	
	
func make_visible(_NodeSelf):  	
	_NodeSelf.show();	
	var check = check_visiblity(_NodeSelf); 
	var node_name = _NodeSelf.name;
	if(check == 1):
		print(node_name, " set to visible(show). ");
	else:
		print(node_name, " set to invisible(hide). ");
	pass;  
		
func make_invisible(_NodeSelf): 
	_NodeSelf.hide();	
	var check = check_visiblity(_NodeSelf); 
	var node_name = _NodeSelf.name;
	if(check == 0):
		print(node_name, " set to invisible(hide). ");
	else:
		print(node_name, " set to visible(show). ");
	pass; 
	
		
func check_visiblity(_NodeSelf):
	if _NodeSelf.visible:
		return(1)
	else:
		return(0)
	pass; 

func _on_PlayButton_pressed():
	pass;

func _on_DraftButton_pressed():
	pass;

func _on_ScoresButton_pressed():
	pass;

func _on_SettingsButton_pressed():
	pass;

func _on_ExitGameButton_pressed(): 
	get_tree().quit();	
	pass # Replace with function body.
	   
