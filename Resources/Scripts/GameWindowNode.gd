extends Node
 
func _ready():    
	# make the title window visible
	if CheckVis_TitleScreen() < 1:
		Toggle_TitleScreen(true); 
	else: 
		print("Title Screen is visible. ");
	pass;
		 
	 
func _process(delta):
	pass;

func _input(event):
	pass;
	 
	
func make_visible(_NodeSelf):  	
	_NodeSelf.show();	
	var check = check_visiblity(_NodeSelf); 
	var node_self_name = _NodeSelf.name;
	print(" working with [",node_self_name,"]")
	if(check == 1):
		print(node_self_name, " set to visible(show). ");
	else:
		print(node_self_name, " set to invisible(hide). ");
	pass;  
		
func make_invisible(_NodeSelf): 
	_NodeSelf.hide();	
	var check = check_visiblity(_NodeSelf); 
	var node_self_name = _NodeSelf.name;
	print(" working with [",node_self_name,"]")
	if(check == 0):
		print(node_self_name, " set to invisible(hide). ");
	else:
		print(node_self_name, " set to visible(show). ");
	pass; 
		
func check_visiblity(_NodeSelf):
	if _NodeSelf.visible:
		print("[visible(show)]");
		return(1)
	else:
		print("[invisible(hide)]");
		return(0)
	pass; 
	
	
func CheckVis_TitleScreen():
		# make the title window visible
	var node_self_name = "Node2D_TitleScreen"
	var node_self = get_node(node_self_name); 
	var check_me = 0;
	print(" working with [",node_self_name,"]")
	if node_self != null:
		check_me = check_visiblity(node_self); 
	else: 
		print(node_self_name, " is null, no toggle performed")
	return(check_me);
	
	
func Toggle_TitleScreen(state):
		# make the title window visible
	var node_self_name = "Node2D_TitleScreen"
	var node_self = get_node(node_self_name); 
	print(" working with [",node_self_name,"]")
	if node_self != null:
		var check_me = check_visiblity(node_self);
		if check_me == 0 && state == true: 
			make_visible(node_self);
		else:
			make_invisible(node_self);
	else: 
		print(node_self_name, " is null, no toggle performed")
	pass;
	
func Toggle_GameWindow(state):
		# make the title window visible
	var node_self_name = "Node2D_GameWindow"
	var node_self = get_node(node_self_name); 
	print(" working with [",node_self_name,"]")
	if node_self != null:
		var check_me = check_visiblity(node_self);
		if check_me == 0 && state == true: 
			make_visible(node_self);
		else:
			make_invisible( node_self );
	else: 
		print(node_self_name, " is null")
	pass;

func Toggle_GameMenu(state):
		# make the title window visible
	var node_self_name = "Node2D_GameMenu"
	var node_self = get_node(node_self_name); 
	print(" working with [",node_self_name,"]")
	if node_self != null:
		var check_me = check_visiblity(node_self);
		if check_me == 0 && state == true: 
			make_visible(node_self);
		else:
			make_invisible( node_self );
	else: 
		print(node_self_name, " is null")
	pass;

func Toggle_OptionsMenu(state):
		# make the title window visible
	var node_self_name = "Node2D_OptionsMenu"
	var node_self = get_node(node_self_name); 
	print(" working with [",node_self_name,"]")
	if node_self != null:
		var check_me = check_visiblity(node_self);
		if check_me == 0 && state == true: 
			make_visible(node_self);
		else:
			make_invisible( node_self );
	else: 
		print(node_self_name, " is null")
	pass;
	
func Toggle_ScoresMenu(state):
		# make the title window visible
	var node_self_name = "Node2D_Scores"
	var node_self = get_node(node_self_name); 
	print(" working with [",node_self_name,"]")
	if node_self != null:
		var check_me = check_visiblity(node_self);
		if check_me == 0 && state == true: 
			make_visible(node_self);
		else:
			make_invisible( node_self );
	else: 
		print(node_self_name, " is null")
	pass;

func Toggle_AboutUsMenu(state):
		# make the title window visible
	var node_self_name = "Node2D_AboutUs"
	var node_self = get_node(node_self_name); 
	print(" working with [",node_self_name,"]")
	if node_self != null:
		var check_me = check_visiblity(node_self);
		if check_me == 0 && state == true: 
			make_visible(node_self);
		else:
			make_invisible( node_self );
	else: 
		print(node_self_name, " is null")
	pass;


func Toggle_Grid(state):
		# make the title window visible
	var node_self_name = "Node2D_Grid"
	var node_self = get_node(node_self_name); 
	print(" working with [",node_self_name,"]")
	if node_self != null:
		var check_me = check_visiblity(node_self);
		if check_me == 0 && state == true: 
			make_visible(node_self);
		else:
			make_invisible( node_self );
	else: 
		print(node_self_name, " is null")
	pass;

func Toggle_Timer(state):
		# make the title window visible
	var node_self_name = "Node2D_Timer"
	var node_self = get_node(node_self_name); 
	print(" working with [",node_self_name,"]")
	if node_self != null:
		var check_me = check_visiblity(node_self);
		if check_me == 0 && state == true: 
			make_visible(node_self);
		else:
			make_invisible( node_self );
	else: 
		print(node_self_name, " is null")
	pass; 

# Title Screen Buttons
func _on_texture_button_ts_start_pressed():
	# make the title window visible
	Toggle_TitleScreen(false);
	Toggle_GameMenu(true);
	
	## Make sure other screens are set correctly.
	Toggle_OptionsMenu(false);
	Toggle_GameWindow(false); 
	Toggle_ScoresMenu(false);
	Toggle_AboutUsMenu(false);
	pass # Replace with function body.

# Game Menu Buttons
func _on_exit_game_button_pressed():
	get_tree().quit();	
	pass # Replace with function body.

func _on_settings_button_pressed():
	Toggle_OptionsMenu(true);
	
	## Make sure other screens are set correctly.
	Toggle_TitleScreen(false);
	Toggle_GameMenu(false);
	Toggle_GameWindow(false); 
	Toggle_ScoresMenu(false);
	Toggle_AboutUsMenu(false);
	pass # Replace with function body.

func _on_scores_button_pressed(): 
	Toggle_ScoresMenu(true);
	
	## Make sure other screens are set correctly.
	Toggle_TitleScreen(false);
	Toggle_OptionsMenu(false);
	Toggle_GameMenu(false);
	Toggle_GameWindow(false);  
	Toggle_AboutUsMenu(false);
	pass # Replace with function body.

func _on_about_us_button_pressed(): 
	Toggle_AboutUsMenu(true);
	
	## Make sure other screens are set correctly.
	Toggle_TitleScreen(false);
	Toggle_OptionsMenu(false);
	Toggle_GameMenu(false);
	Toggle_GameWindow(false); 
	Toggle_ScoresMenu(false);
	pass # Replace with function body.

func _on_play_button_pressed(): 
	Toggle_GameWindow(true); 
	
	## Make sure other screens are set correctly.
	Toggle_TitleScreen(false);
	Toggle_OptionsMenu(false);	
	Toggle_GameMenu(false);
	Toggle_AboutUsMenu(false);
	Toggle_ScoresMenu(false);
	pass # Replace with function body.


# Game Window Buttons
func _on_texture_button_exit_pressed():
	get_tree().quit();	
	pass # Replace with function body.

func _on_texture_button_start_pressed():
	pass # Replace with function body.

func _on_texture_button_main_menu_pressed():
	Toggle_GameMenu(true);
	
	## Make sure other screens are set correctly.
	Toggle_TitleScreen(false);
	Toggle_OptionsMenu(false);
	Toggle_AboutUsMenu(false);
	Toggle_ScoresMenu(false);
	Toggle_GameWindow(false); 
	pass # Replace with function body.
