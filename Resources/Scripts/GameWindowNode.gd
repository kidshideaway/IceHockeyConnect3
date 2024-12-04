extends Node

# json initial save game file.
var my_save_game_dict = {
	"file_name_1": "hattrick_v3_save_1.dat",
	"file_name_2": "hattrick_v3_save_2.dat",
	"file_name_3": "hattrick_v3_save_3.dat",
	"player_name": "player one",
	"player_level": 0,
	"player_score": 0,
	"top_score_1": 0,
	"top_score_2": 0,
	"top_score_3": 0,
	"top_score_4": 0,
	"top_score_5": 0,
}

####### -- Menu Display States  -- #######
var _title = false;
var _start = false;
var _settings = false;
var _scores = false;
var _about = false;
var _load = false;
var _save = false;
var _help = false;
var _game = false;
var _timer = false;
var _grid = false;
var _ready_counter = 0;
var my_script = "GameWiindowNode.gd";
var zindex_visible = 99;
var zindex_hidden = 1;

####### -- Save Game Data  -- #######
var file_name_1 = "hattrick_v3_save_1.dat";
var file_name_2 = "hattrick_v3_save_2.dat";
var file_name_3 = "hattrick_v3_save_3.dat";
var player_name = "player one";
var player_level = 0;
var player_score = 0;
var top_score_1 = 0;
var top_score_2 = 0;
var top_score_3 = 0;
var top_score_4 = 0;
var top_score_5 = 0;

var is_saved_file_1 = false;
var is_saved_file_2 = false;
var is_saved_file_3 = false;

var is_loaded_file_1 = false;
var is_loaded_file_2 = false;
var is_loaded_file_3 = false;

var file_exists_sprite_texture = load("res://Resources/UI/Sprites/spr_gem_blue.png");
var file_does_not_exists_sprite_texture = load("res://Resources/UI/Sprites/spr_gem_red.png");
var file_saved_sprite_texture = load("res://Resources/UI/Sprites/spr_gem_green.png");
var file_not_saved_sprite_texture = load("res://Resources/UI/Sprites/spr_gem_red.png");

var node_path_LM_FileExists_1 = "Node2D_LoadMenu/VBoxContainer4/HBox_Slot1/Sprite2D_FileExists_1";
var node_path_LM_FileSaved_1 = "Node2D_LoadMenu/VBoxContainer4/HBox_Slot1/Sprite2D_FileSaved_1";
var node_path_LM_FileExists_2 = "Node2D_LoadMenu/VBoxContainer4/HBoxSlot2/Sprite2D_FileExists_2";
var node_path_LM_FileSaved_2 = "Node2D_LoadMenu/VBoxContainer4/HBoxSlot2/Sprite2D_FileSaved_2";
var node_path_LM_FileExists_3 = "Node2D_LoadMenu/VBoxContainer4/HBoxSlot3/Sprite2D_FileExists_3";
var node_path_LM_FileSaved_3 = "Node2D_LoadMenu/VBoxContainer4/HBoxSlot3/Sprite2D_FileSaved_3";

var node_path_SM_FileExists_1 = "Node2D_SaveMenu/VBoxContainer/HBox_Slot1/Sprite2D_FileExists_1";
var node_path_SM_FileSaved_1 = "Node2D_SaveMenu/VBoxContainer/HBox_Slot1/Sprite2D_FileSaved_1";
var node_path_SM_FileExists_2 = "Node2D_SaveMenu/VBoxContainer/HBoxSlot2/Sprite2D_FileExists_2";
var node_path_SM_FileSaved_2 = "Node2D_SaveMenu/VBoxContainer/HBoxSlot2/Sprite2D_FileSaved_2";
var node_path_SM_FileExists_3 = "Node2D_SaveMenu/VBoxContainer/HBoxSlot3/Sprite2D_FileExists_3";
var node_path_SM_FileSaved_3 = "Node2D_SaveMenu/VBoxContainer/HBoxSlot3/Sprite2D_FileSaved_3";


func _ready():
	# make the title window visible
	var my_func = "_ready";
	var my_node = "Node2D_TitleMenu";
	print("[",my_script,"][",my_func,"] START:",_ready_counter)
	var _title = true
	var result = valid_node_check(my_script, my_func, my_node);
	if result == true:
		set_screen_states(_title, _start, _settings, _scores, _about, _load, _save, _help, _game, _timer, _grid);
	_ready_counter = _ready_counter +1
	print("[",my_script,"][",my_func,"] END - loop number:",_ready_counter)


func set_screen_states(title_state, start_state, settings_state, scores_state, about_state, load_state, save_state, help_state, game_state, timer_state, grid_state):
	print("set_screen_states","|", title_state,"|", start_state,"|", settings_state,"|", scores_state,"|", about_state,"|", load_state,"|", save_state,"|", help_state,"|", game_state,"|", timer_state,"|", grid_state)
	Toggle_TitleMenu(title_state);
	Toggle_StartMenu(start_state);
	Toggle_SettingsMenu(settings_state);
	Toggle_ScoresMenu(scores_state);
	Toggle_AboutMenu(about_state);
	Toggle_LoadMenu(load_state);
	Toggle_SaveMenu(save_state);
	Toggle_HelpMenu(help_state);
	Toggle_GameWindow(game_state);
	Toggle_Timer(timer_state);
	Toggle_Grid(grid_state);

func _process(delta):
	#print("delta", delta, " ");
	pass;

func _input(event):
	#print("event", event, " ");
	pass;

func valid_node_check(my_script, my_func, my_node):
	if has_node(my_node) == true:
		#print("[",my_script,"][",my_func,"][",my_node,"] ","Is present in the scene tree, has_node")
		if get_node(my_node):
			#print("[",my_script,"][",my_func,"][",my_node,"] ","Is present in the scene tree, get_node")
			return(true)
		else:
			print("[",my_script,"][",my_func,"][",my_node,"] ","The node is not found, get_node")
	else:
		print("[",my_script,"][",my_func,"][",my_node,"] ","The node is not found, has_node")
	return(false)

func Toggle_TitleMenu(state):
	var my_func = "Toggle_TitleMenu";
	var my_node = "Node2D_TitleMenu";
	var result = valid_node_check(my_script, my_func, my_node);
	if result == true:
		var active_node = get_node(my_node)
		if active_node.is_inside_tree() == true:
			var results = VisibilityMenuActions(active_node, state);
			print("[",my_script,"][",my_func,"][",my_node,"] ","The node is valid! [", active_node,"] [",state,"] [",results,"]");
		else:
			print("[",my_script,"][",my_func,"][",my_node,"] "," invalid node, is_inside_tree")

func Toggle_StartMenu(state):
	var my_func = "Toggle_StartMenu";
	var my_node = "Node2D_StartMenu";
	var result = valid_node_check(my_script, my_func, my_node);
	if result == true:
		var active_node = get_node(my_node)
		if active_node.is_inside_tree() == true:
			var results = VisibilityMenuActions(active_node, state);
			print("[",my_script,"][",my_func,"][",my_node,"] ","The node is valid! [", active_node,"] [",state,"] [",results,"]");
		else:
			print("[",my_script,"][",my_func,"][",my_node,"] "," invalid node, is_inside_tree")

func Toggle_LoadMenu(state):
	var my_func = "Toggle_LoadMenu";
	var my_node = "Node2D_LoadMenu"

	var Sprite2D_FileExists_1 = get_node(node_path_LM_FileExists_1);
	var Sprite2D_FileExists_2 = get_node(node_path_LM_FileExists_2);
	var Sprite2D_FileExists_3 = get_node(node_path_LM_FileExists_3);

	var Sprite2D_FileSaved_1 = get_node(node_path_LM_FileSaved_1);
	var Sprite2D_FileSaved_2 = get_node(node_path_LM_FileSaved_2);
	var Sprite2D_FileSaved_3 = get_node(node_path_LM_FileSaved_3);

	var result = valid_node_check(my_script, my_func, my_node);
	if result == true:
		var active_node = get_node(my_node)
		if active_node.is_inside_tree() == true:
			var results = VisibilityMenuActions(active_node, state);
			print("[",my_script,"][",my_func,"][",my_node,"] ","The node is valid! [", active_node,"] [",state,"] [",results,"]");

			var does_file_1_exist = _file_io_exists(file_name_1);
			if does_file_1_exist == true:
				Sprite2D_FileExists_1.set_texture(file_exists_sprite_texture);
			else:
				Sprite2D_FileExists_1.set_texture(file_does_not_exists_sprite_texture);
			if is_saved_file_1 == true:
				Sprite2D_FileSaved_1.set_texture(file_saved_sprite_texture);
			else:
				Sprite2D_FileSaved_1.set_texture(file_not_saved_sprite_texture);

			var does_file_2_exist = _file_io_exists(file_name_2);
			if does_file_2_exist == true:
				Sprite2D_FileExists_2.set_texture(file_exists_sprite_texture);
			else:
				Sprite2D_FileExists_2.set_texture(file_does_not_exists_sprite_texture);
			if is_saved_file_2 == true:
				Sprite2D_FileSaved_2.set_texture(file_saved_sprite_texture);
			else:
				Sprite2D_FileSaved_2.set_texture(file_not_saved_sprite_texture);

			var does_file_3_exist = _file_io_exists(file_name_3);
			if does_file_3_exist == true:
				Sprite2D_FileExists_3.set_texture(file_exists_sprite_texture);
			else:
				Sprite2D_FileExists_3.set_texture(file_does_not_exists_sprite_texture);
			if is_saved_file_3 == true:
				Sprite2D_FileSaved_3.set_texture(file_saved_sprite_texture);
			else:
				Sprite2D_FileSaved_3.set_texture(file_not_saved_sprite_texture);

		else:
			print("[",my_script,"][",my_func,"][",my_node,"] ","invalid node, is_inside_tree")

func Toggle_SaveMenu(state):
	var my_func = "Toggle_SaveMenu";
	var my_node = "Node2D_SaveMenu";

	var Sprite2D_FileExists_1 = get_node(node_path_SM_FileExists_1);
	var Sprite2D_FileExists_2 = get_node(node_path_SM_FileExists_2);
	var Sprite2D_FileExists_3 = get_node(node_path_SM_FileExists_3);

	var Sprite2D_FileSaved_1 = get_node(node_path_SM_FileSaved_1);
	var Sprite2D_FileSaved_2 = get_node(node_path_SM_FileSaved_2);
	var Sprite2D_FileSaved_3 = get_node(node_path_SM_FileSaved_3);

	var result = valid_node_check(my_script, my_func, my_node);
	if result == true:
		var active_node = get_node(my_node)
		if active_node.is_inside_tree() == true:
			var results = VisibilityMenuActions(active_node, state);
			print("[",my_script,"][",my_func,"][",my_node,"] ","The node is valid! [", active_node,"] [",state,"] [",results,"]");

			var does_file_1_exist = _file_io_exists(file_name_1);
			if does_file_1_exist == true:
				Sprite2D_FileExists_1.set_texture(file_exists_sprite_texture);
			else:
				Sprite2D_FileExists_1.set_texture(file_does_not_exists_sprite_texture);
			if is_saved_file_1 == true:
				Sprite2D_FileSaved_1.set_texture(file_saved_sprite_texture);
			else:
				Sprite2D_FileSaved_1.set_texture(file_not_saved_sprite_texture);

			var does_file_2_exist = _file_io_exists(file_name_2);
			if does_file_2_exist == true:
				Sprite2D_FileExists_2.set_texture(file_exists_sprite_texture);
			else:
				Sprite2D_FileExists_2.set_texture(file_does_not_exists_sprite_texture);
			if is_saved_file_2 == true:
				Sprite2D_FileSaved_2.set_texture(file_saved_sprite_texture);
			else:
				Sprite2D_FileSaved_2.set_texture(file_not_saved_sprite_texture);

			var does_file_3_exist = _file_io_exists(file_name_3);
			if does_file_3_exist == true:
				Sprite2D_FileExists_3.set_texture(file_exists_sprite_texture);
			else:
				Sprite2D_FileExists_3.set_texture(file_does_not_exists_sprite_texture);
			if is_saved_file_3 == true:
				Sprite2D_FileSaved_3.set_texture(file_saved_sprite_texture);
			else:
				Sprite2D_FileSaved_3.set_texture(file_not_saved_sprite_texture);

		else:
			print("[",my_script,"][",my_func,"][",my_node,"] ","invalid node, is_inside_tree")

func Toggle_HelpMenu(state):
	var my_func = "Toggle_HelpMenu";
	var my_node = "Node2D_HelpMenu";
	var result = valid_node_check(my_script, my_func, my_node);
	if result == true:
		var active_node = get_node(my_node)
		if active_node.is_inside_tree() == true:
			var results = VisibilityMenuActions(active_node, state);
			print("[",my_script,"][",my_func,"][",my_node,"] ","The node is valid! [", active_node,"] [",state,"] [",results,"]");
		else:
			print("[",my_script,"][",my_func,"][",my_node,"] ","invalid node, is_inside_tree")

func Toggle_GameWindow(state):
	var my_func = "Toggle_GameWindow";
	var my_node = "Node2D_GameWindow";
	var result = valid_node_check(my_script, my_func, my_node);
	if result == true:
		var active_node = get_node(my_node)
		if active_node.is_inside_tree() == true:
			var results = VisibilityMenuActions(active_node, state);
			print("[",my_script,"][",my_func,"][",my_node,"] ","The node is valid! [", active_node,"] [",state,"] [",results,"]");
		else:
			print("[",my_script,"][",my_func,"][",my_node,"] ","invalid node, is_inside_tree")

func Toggle_SettingsMenu(state):
	var my_func = "Toggle_SettingsMenu";
	var my_node = "Node2D_SettingsMenu";
	var result = valid_node_check(my_script, my_func, my_node);
	if result == true:
		var active_node = get_node(my_node)
		if active_node.is_inside_tree() == true:
			var results = VisibilityMenuActions(active_node, state);
			print("[",my_script,"][",my_func,"][",my_node,"] ","The node is valid! [", active_node,"] [",state,"] [",results,"]");
		else:
			print("[",my_script,"][",my_func,"][",my_node,"] ","invalid node, is_inside_tree")

func Toggle_ScoresMenu(state):
	var my_func = "Toggle_ScoresMenu";
	var my_node = "Node2D_ScoresMenu";
	var result = valid_node_check(my_script, my_func, my_node);
	if result == true:
		var active_node = get_node(my_node)
		if active_node.is_inside_tree() == true:
			var results = VisibilityMenuActions(active_node, state);
			print("[",my_script,"][",my_func,"][",my_node,"] ","The node is valid! [", active_node,"] [",state,"] [",results,"]");
		else:
			print("[",my_script,"][",my_func,"][",my_node,"] ","invalid node, is_inside_tree")

func Toggle_AboutMenu(state):
	var my_func = "Toggle_AboutMenu";
	var my_node = "Node2D_AboutMenu";
	var result = valid_node_check(my_script, my_func, my_node);
	if result == true:
		var active_node = get_node(my_node)
		if active_node.is_inside_tree() == true:
			var results = VisibilityMenuActions(active_node, state);
			print("[",my_script,"][",my_func,"][",my_node,"] ","The node is valid! [", active_node,"] [",state,"] [",results,"]");
		else:
			print("[",my_script,"][",my_func,"][",my_node,"] ","invalid node, is_inside_tree")

func Toggle_Grid(state):
	var my_func = "Toggle_Grid";
	var my_node = "Node2D_Grid";
	var result = valid_node_check(my_script, my_func, my_node);
	if result == true:
		var active_node = get_node(my_node)
		if active_node.is_inside_tree() == true:
			var results = VisibilityMenuActions(active_node, state);
			print("[",my_script,"][",my_func,"][",my_node,"] ","The node is valid! [", active_node,"] [",state,"] [",results,"]");
		else:
			print("[",my_script,"][",my_func,"][",my_node,"] ","invalid node, is_inside_tree")

func Toggle_Timer(state):
	var my_func = "Toggle_Timer";
	var my_node = "Node2D_Timer";
	var result = valid_node_check(my_script, my_func, my_node);
	if result == true:
		var active_node = get_node(my_node)
		if active_node.is_inside_tree() == true:
			var results = VisibilityMenuActions(active_node, state);
			print("[",my_script,"][",my_func,"][",my_node,"] ","The node is valid! [", active_node,"] [",state,"] [",results,"]");
		else:
			print("[",my_script,"][",my_func,"][",my_node,"] ","invalid node, is_inside_tree")


func VisibilityMenuActions(Node_Self, state):
	var my_func = "VisibilityMenuActions";
	var my_node = Node_Self;
	if my_node == null:
		print("[",my_script,"][",my_func,"][",my_node,"] ","The node is null!")
	else:
		if typeof(state) == TYPE_BOOL:
			var active_state = my_node.is_visible_in_tree();
			#print("[",my_script,"][",my_func,"][",my_node,"] ","TYPE_BOOL [", active_state,"][",state,"] ")
			if active_state == false and state == true:
				print("[",my_script,"][",my_func,"][",my_node,"] ","TYPE_BOOL is_visible_in_tree [", active_state,"][",state,"] toggle")
				my_node.visible = true;
				var active_state2 = my_node.is_visible_in_tree();
				if my_node.z_index < zindex_visible:
					my_node.z_index = zindex_visible
				var parent_node = my_node.get_parent()
				var parent_type = my_node.get_parent().get_class()
				if parent_node is Node2D or parent_type == "Node2D":
					var parent_active_state = parent_node.visible
					if parent_active_state !=state:
						parent_node.visible = state
				return(active_state2);
			elif active_state == true and state == false:
				print("[",my_script,"][",my_func,"][",my_node,"] ","TYPE_BOOL is_visible_in_tree [", active_state,"][",state,"] toggle")
				my_node.visible = false;
				var active_state2 = my_node.is_visible_in_tree();
				if my_node.z_index > zindex_hidden:
					my_node.z_index = zindex_hidden
				return(active_state2);
			elif active_state == false and state == false:
				#print("[",my_script,"][",my_func,"][",my_node,"] ","TYPE_BOOL is_visible_in_tree [", active_state,"][",state,"] ")
				return(false);
			elif active_state == true and state == true:
				#print("[",my_script,"][",my_func,"][",my_node,"] ","is_visible_in_tree [", active_state,"][",state,"] ")
				return(true);
			else:
				print("[",my_script,"][",my_func,"][",my_node,"] ","what happened? [", active_state,"][",state,"] ")
		elif typeof(state) == TYPE_STRING:
			if state == "toggle":
				var active_state = my_node.is_visible_in_tree();
				if active_state == true:
					my_node.visible = false;
					print("[",my_script,"][",my_func,"][",my_node,"] ","TYPE_STRING [", active_state,"][",state,"] toggle")
					return(false);
				else:
					print("[",my_script,"][",my_func,"][",my_node,"] ","TYPE_STRING [", active_state,"][",state,"] toggle")
					my_node.visible = true;
					return(true);
		else:
			print("[",my_script,"][",my_func,"][",my_node,"] ","what happened? [","][",state,"] ")
	return("NULL");

# Title Screen Buttons
func _on_title_button_pressed():
	var my_func = "_on_title_button_pressed";
	var my_node = "button";
	var _title = true;
	print("[",my_script,"][",my_func,"][",my_node,"] "," Pressed.")
	set_screen_states(_title, _start, _settings, _scores, _about, _load, _save, _help, _game, _timer, _grid);
	pass # Replace with function body.

func _on_start_button_pressed():
	var my_func = "_on_start_button_pressed";
	var my_node = "button";
	var _start = true;
	print("[",my_script,"][",my_func,"][",my_node,"] "," Pressed.")
	set_screen_states(_title, _start, _settings, _scores, _about, _load, _save, _help, _game, _timer, _grid);
	pass # Replace with function body.

func _on_settings_button_pressed():
	var my_func = "_on_settings_button_pressed";
	var my_node = "button";
	var _settings = true;
	print("[",my_script,"][",my_func,"][",my_node,"] "," Pressed.")
	set_screen_states(_title, _start, _settings, _scores, _about, _load, _save, _help, _game, _timer, _grid);
	pass # Replace with function body.

func _on_scores_button_pressed():
	var my_func = "_on_scores_button_pressed";
	var my_node = "button";
	var _scores = true;
	print("[",my_script,"][",my_func,"][",my_node,"] "," Pressed.")
	set_screen_states(_title, _start, _settings, _scores, _about, _load, _save, _help, _game, _timer, _grid);

func _on_about_us_button_pressed():
	var my_func = "_on_about_us_button_pressed";
	var my_node = "button";
	var _about = true;
	print("[",my_script,"][",my_func,"][",my_node,"] "," Pressed.")
	set_screen_states(_title, _start, _settings, _scores, _about, _load, _save, _help, _game, _timer, _grid);
	pass # Replace with function body.

func _on_load_button_pressed():
	var my_func = "_on_load_button_pressed";
	var my_node = "button";
	var _load = true;
	print("[",my_script,"][",my_func,"][",my_node,"] "," Pressed.")
	set_screen_states(_title, _start, _settings, _scores, _about, _load, _save, _help, _game, _timer, _grid);
	pass # Replace with function body.

func _on_save_button_pressed():
	var my_func = "_on_save_button_pressed";
	var my_node = "button";
	var _save = true;
	print("[",my_script,"][",my_func,"][",my_node,"] "," Pressed.")
	set_screen_states(_title, _start, _settings, _scores, _about, _load, _save, _help, _game, _timer, _grid);
	pass # Replace with function body.

func _on_help_button_pressed():
	var my_func = "_on_help_button_pressed";
	var my_node = "button";
	var _help = true;
	print("[",my_script,"][",my_func,"][",my_node,"] "," Pressed.")
	set_screen_states(_title, _start, _settings, _scores, _about, _load, _save, _help, _game, _timer, _grid);
	pass # Replace with function body.

func _on_play_button_pressed():
	var my_func = "_on_play_button_pressed";
	var my_node = "button";
	var _game = true;
	print("[",my_script,"][",my_func,"][",my_node,"] "," Pressed.")
	set_screen_states(_title, _start, _settings, _scores, _about, _load, _save, _help, _game, _timer, _grid);
	pass # Replace with function body.

func _on_save_file_1_button_pressed() -> void:
	save_file_system(file_name_1);
	pass # Replace with function body.

func _on_save_file_2_button_pressed() -> void:
	save_file_system(file_name_2);
	pass # Replace with function body.

func _on_save_file_3_button_pressed() -> void:
	save_file_system(file_name_3);
	pass # Replace with function body.

func _on_load_file_1_button_pressed() -> void:
	load_file_system(file_name_1);
	pass # Replace with function body.

func _on_load_file_2_button_pressed() -> void:
	load_file_system(file_name_2);
	pass # Replace with function body.

func _on_load_file_3_button_pressed() -> void:
	load_file_system(file_name_3);
	pass # Replace with function body.

# Game Window Buttons
func _on_exit_button_pressed():
	var my_func = "_on_exit_button_pressed";
	var my_node = "button";
	print("[",my_script,"][",my_func,"][",my_node,"] "," Pressed.")
	get_tree().quit();
	pass # Replace with function body.

func _file_io_read(my_save_game_file):
	var file = FileAccess.open("user://"+my_save_game_file, FileAccess.READ)
	var my_file_data = file.get_as_text()
	print("Opened file (READ): "+my_save_game_file);
	return my_file_data

func _file_io_write(my_save_game_file, my_file_data):
	var file = FileAccess.open("user://"+my_save_game_file, FileAccess.WRITE)
	file.store_string(my_file_data)
	print("Opened and wrote file (WRITE): "+my_save_game_file);
	pass

# parse each config setting into variabele and data.
func _parse_a_line(str_result_section):
# Break section into variable and variable contents
	var regex_variable = RegEx.new();
	regex_variable.compile("^(\\w)*\\:") # ex: test: (will need to remove : )
	var result_variable = regex_variable.search(str_result_section);
	var str_result_variable = result_variable.get_string()
	str_result_variable = str_result_variable.replace(":",""); # remove delimiter
	print(str_result_variable); # Would print n-0123

	var regex_variable_data = RegEx.new();
	regex_variable_data.compile("\\:(.)*$"); # ex: test: (will need to remove : )
	var result_variables_data = regex_variable_data.search(str_result_section);
	var str_result_variables_data = result_variables_data.get_string()
	str_result_variables_data = str_result_variables_data.replace(":",""); # remove delimiter+
	print(str_result_variables_data); # Would print n-0123

	return  [str_result_variable, str_result_variables_data]

# parse the file into lines, important if multiple players use the same computer.
func _parse_file_contents(my_file_data):
	print("Parsing save game file.");
	var regex_newline = RegEx.new()
	regex_newline.compile("\\n")
	var result_newline = regex_newline.search(my_file_data)

	if result_newline:
		var str_newline = result_newline.get_string()
		print(str_newline) # Would print n-0123
		_parse_line_contents(str_newline);
	else:
		var str_file = str(my_file_data);
		print("No new line found, ending parse."+str_file);
	pass

# parse each line to break out the data.
func _parse_line_contents(str_newline):
	var regex_section = RegEx.new();
	regex_section.compile("^(\\w)*\\;") # ex: test: (will need to remove ; )
	var result_section = regex_section.search(str_newline);

	if result_section:
		var str_result_section = result_section.get_string()
		str_result_section = str_result_section.replace(";",""); # removing delimiter
		print(str_result_section); # Would print n-0123
		var config_set = _parse_a_line(str_result_section);
		_build_save_dict(config_set[0], config_set[1]);

	else:
		var str_file = str(str_newline);
		print("No end of line found, ending parse."+str_file);

func _build_save_dict(var_name, var_content):
	if var_name == "file_name":
		my_save_game_dict["file_name"] = var_content;
	elif var_name == "player_name":
		my_save_game_dict["player_name"] = var_content;
	elif var_name == "player_level":
		my_save_game_dict["player_level"] = var_content;
	elif var_name == "player_score":
		my_save_game_dict["player_score"] = var_content;
	else:
		print("Var does not exist: " + var_name + " | " + var_content);
	pass

func _file_io_exists(my_save_game_file):
	var fileexists = FileAccess.file_exists("user://" + my_save_game_file);
	print("Does save file exists(" + str(fileexists) + "): " + my_save_game_file);
	return fileexists

func load_file_system(file_name):
	if file_name == "NULL":
		file_name = my_save_game_dict["file_name"];

	print("Does file exist: " + file_name);
	var fileexists = _file_io_exists( file_name );

	if fileexists:
		print("Begin reading file: " + file_name);
		var my_file_data = _file_io_read(file_name);
		_parse_file_contents(my_file_data);
	else:
		print("Create file: " + file_name);
		var format_string = """file_name:%s;player_name:%s;player_level:%s;player_score:%s;\\n""";
		var my_file_data = format_string % [
			file_name,
			my_save_game_dict["player_name"],
			str(my_save_game_dict["player_level"]),
			str(my_save_game_dict["player_score"])
			];
		_file_io_write(file_name, my_file_data);

	pass # Replace with function body.

func save_file_system(file_name):
	if file_name == "NULL":
		file_name = my_save_game_dict["file_name"];
	# save file, if does not exist create, and then save.
	print("Does file exist: " + file_name);
	# attempt to load existing file:
	var fileexists = _file_io_exists(file_name );

	if fileexists:
		print("Begin reading file: " + file_name);
		var my_file_data = _file_io_read(file_name);
		_parse_file_contents(my_file_data);

	# if file does not exist create the file
	else:
		print("Create file: " + file_name);
		var format_string = """file_name:%s;player_name:%s;player_level:%s;player_score:%s;\\n""";
		var my_file_data = format_string % [
			file_name,
			my_save_game_dict["player_name"],
			str(my_save_game_dict["player_level"]),
			str(my_save_game_dict["player_score"])
			];
		_file_io_write(file_name, my_file_data);

	pass # Replace with function body.
