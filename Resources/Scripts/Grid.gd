extends Node2D

onready var Global = get_node("/root/Global");  

# variables for pieces
var possible_pieces = [
	preload("res://Resources/Scenes/Reg_Blue_Piece.tscn"),
	preload("res://Resources/Scenes/Reg_Green_Piece.tscn"),
	preload("res://Resources/Scenes/Reg_Orange_Piece.tscn"),
	preload("res://Resources/Scenes/Reg_Yellow_Piece.tscn"),
	preload("res://Resources/Scenes/Reg_Pink_Piece.tscn"),
	preload("res://Resources/Scenes/Reg_Purple_Piece.tscn"),
	preload("res://Resources/Scenes/Reg_LitePink_Piece.tscn"),
	preload("res://Resources/Scenes/Reg_Rainbow_Piece.tscn"),
	preload("res://Resources/Scenes/Reg_LiteOrange_Piece.tscn"),
	preload("res://Resources/Scenes/Reg_LiteGreen_Piece.tscn")
];
  
#Two dimensional array to hold coordinates x,y plane
var all_pieces = [];

################### Grid Variables ########################## 
export (int) var width =4;
export (int) var height =4;
export (int) var x_start;
export (int) var y_start;
export (int) var offset =1;
export (int) var score;
export (int) var value;
export (int) var bonus;
export (int) var active_level;
export (int) var id;
export (int) var level = 1;
 
# Touch variables
var first_touch = Vector2(0,0);
var final_touch = Vector2(0,0);
var controlling = false;
var max_num_pieces_per_level = 4;


# Called when the node enters the scene tree for the first time.
func _ready(): 
	print(active_level)
	randomize();
	_read_level_specs();
	print("Goals: ") 
	print(Global.LS_id) 
	print("Size: ") 
	print(Global.LS_width) 
	print(Global.LS_height) 
	print(Global.goal) # Prints n entry
	print("Points: ") # Prints n entry
	print(Global.points_1) # Prints n entry
	print(Global.points_2) # Prints n entry
	print(Global.points_3) # Prints n entry
	print("Minutes: ") # Prints n entry
	print(Global.minutes_1) # Prints n entry
	print(Global.minutes_2) # Prints n entry
	print(Global.minutes_3) # Prints n entry
	print("Turns: ") # Prints n entry
	print(Global.turns_1) # Prints n entry
	print(Global.turns_2) # Prints n entry
	print(Global.turns_3) # Prints n entry
	print("Type: ") # Prints n entry
	print(Global.type_1) # Prints n entry
	print(Global.type_2) # Prints n entry
	print(Global.type_3) # Prints n entry
	print("Color: ") # Prints n entry
	print(Global.color_1) # Prints n entry
	print(Global.color_2) # Prints n entry
	print(Global.color_3) # Prints n entry
	print("Reward: ") # Prints n entry
	print(Global.reward_1) # Prints n entry
	print(Global.reward_2) # Prints n entry
	print(Global.reward_3) # Prints n entry
	print("Amount: ") # Prints n entry
	print(Global.amount_1) # Prints n entry
	print(Global.amount_2) # Prints n entry
	print(Global.amount_3) # Prints n entry
	all_pieces = make_2d_array();
	spawn_pieces(); 

func make_2d_array():
	var array = [];
	for i in width:
		array.append([]);
		for j in height:
			array[i].append(null);
	return array;

func spawn_pieces():
	for i in width:
		for j in height:
			var rand = floor(rand_range(0,max_num_pieces_per_level));
			var piece = possible_pieces[rand].instance();
			var loops = 0;
			while ( match_at(i,j, piece.color) && loops < 100):
				rand = floor(rand_range(0, max_num_pieces_per_level));
				loops += 1;
				piece = possible_pieces[rand].instance();
			add_child(piece);
			piece.position = grid_to_pixel(i,j);
			all_pieces[i][j] = piece;

func grid_to_pixel(column, row):
	var new_x = x_start + offset * column;
	var new_y = y_start + -offset * row;
	return Vector2(new_x, new_y);

func match_at(i, j, color): 
	if i > 1:
		if all_pieces[i-1][j] != null && all_pieces[i-2][j] != null:
			if all_pieces[i-1][j].color == color && all_pieces[i-2][j]. color == color:
				return true;
	if j > 1:
		if all_pieces[i][j-1] != null && all_pieces[i][j-2] != null:
			if all_pieces[i][j-1].color == color && all_pieces[i][j-2]. color == color:
				return true;

func pixel_to_grid(pixel_x, pixel_y):
	var new_x = round((pixel_x - x_start) / offset);
	var new_y = round((pixel_y - y_start) / -offset);
	return Vector2(new_x, new_y); 

func is_in_grid(column, row):
	if column >=0 && column < width:
		if row >= 0 && row < height:
			return true;
	return false;
	
func is_in_grid_single(grid_position):
	if grid_position.x >=0 && grid_position.x < width:
		if grid_position.y >= 0 && grid_position.y < height:
			return true;
	return false;

func touch_input(): 
	if Input.is_action_just_pressed("ui_touch"):
		if is_in_grid_single(pixel_to_grid( (get_global_mouse_position().x), (get_global_mouse_position().y) )): 
			first_touch = pixel_to_grid( (get_global_mouse_position().x), (get_global_mouse_position().y) ); 
			controlling = true; 
			
	if Input.is_action_just_released("ui_touch"):		
		if is_in_grid_single( pixel_to_grid( (get_global_mouse_position().x), (get_global_mouse_position().y) )) && controlling == true:
			controlling = false;
			final_touch = pixel_to_grid( (get_global_mouse_position().x), (get_global_mouse_position().y) ); 
			touch_difference(first_touch, final_touch);

func swap_pieces(column, row, direction):
	var matchcheck = 0; 
	var b_column = column + direction.x;
	var b_row = row + direction.y; 
	var first_piece = all_pieces[column][row];
	var other_piece = all_pieces[b_column][b_row] 
	
	if first_piece != null && other_piece !=null: 
		all_pieces[b_column][b_row] = first_piece; 
		all_pieces[column][row] = other_piece;  
		first_piece.move(grid_to_pixel(column+direction.x,row+direction.y)); 
		other_piece.move(grid_to_pixel(column,row)); 
		matchcheck = find_matches();   
		if(matchcheck != 1):
			get_parent().get_node("UndoDriver_Timer").start();
			undo_move(column, row, direction);  
		

func undo_move(column, row, direction): 
	var t = Timer.new();
	t.set_wait_time(.5);
	t.set_one_shot(true);
	self.add_child(t);
	t.start();  
	yield(t, "timeout");
	t.queue_free();  
	var b_column = column + direction.x; 
	var b_row = row + direction.y;
	var first_piece = all_pieces[column][row];
	var other_piece = all_pieces[b_column][b_row];
	all_pieces[column][row] = other_piece;
	all_pieces[b_column][b_row] = first_piece;    
	other_piece.move(grid_to_pixel(column,row));  
	first_piece.move(grid_to_pixel(b_column,b_row));   

func touch_difference(grid_1, grid_2):
	var difference = grid_2 - grid_1;
	if abs(difference.x) > abs(difference.y):
		if difference.x > 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(1,0));
		elif difference.x < 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(-1,0));
	if abs(difference.y) > abs(difference.x):
		if difference.y > 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(0,1));
		elif difference.y < 0:
			swap_pieces(grid_1.x, grid_1.y, Vector2(0,-1));

func _process(delta):
	touch_input();

func find_matches():
	var matchcheck = 0;
	for i in width:
		for j in height:
			if all_pieces[i][j] != null:
				var current_color = all_pieces[i][j].color;
				if i > 0 && i < width -1:
					if all_pieces[i - 1][j] != null && all_pieces[i + 1][j] != null:
						if all_pieces[i - 1][j].color == current_color && all_pieces[i + 1][j].color == current_color:
							all_pieces[i - 1][j].matched = true;
							all_pieces[i - 1][j].dim(); 
							all_pieces[i + 1][j].matched = true;
							all_pieces[i + 1][j].dim();
							all_pieces[i][j].matched = true;
							all_pieces[i][j].dim();
							get_parent().get_node("Destroy_Timer").start();							
							matchcheck = 1;  
				if j > 0 && j < height -1:
					if all_pieces[i][j - 1] != null && all_pieces[i][j + 1] != null:
						if all_pieces[i][j - 1].color == current_color && all_pieces[i][j + 1].color == current_color:
							all_pieces[i][j - 1].matched = true;
							all_pieces[i][j - 1].dim();
							all_pieces[i][j + 1].matched = true;
							all_pieces[i][j + 1].dim();
							all_pieces[i][j].matched = true;
							all_pieces[i][j].dim();
							get_parent().get_node("Destroy_Timer").start();
							matchcheck = 1; 
	return(matchcheck);

func destroy_matched():
	var num_pieces_destroyed = 0;
	var position_of_match = 0;
	for i in width:
		for j in height:
			if all_pieces[i][j] != null:
				if all_pieces[i][j].matched:
					all_pieces[i][j].queue_free(); 
					all_pieces[i][j] = null;
					num_pieces_destroyed = num_pieces_destroyed + 1; 
					position_of_match = grid_to_pixel(i, j)
	get_parent().get_node("Collapse_Timer").start();
	get_parent().get_node("Fill_Timer").start();
	get_parent().get_node("MatchCheck_Timer").start();
	score = update_score(num_pieces_destroyed, score, position_of_match);
	Global.shots_on_goal_player_1 = update_shots_on_goal_player_1(num_pieces_destroyed, Global.shots_on_goal_player_1);
	pass;  

func clear_2d_array(): 
	for i in width: 
		for j in height:
			all_pieces[i][j].queue_free()
	pass;

func collapse_columns():
	for i in width:
		for j in height:
			if all_pieces[i][j] == null:
				for k in range(j+1, height):
					if all_pieces[i][k] != null:
						all_pieces[i][k].move(grid_to_pixel(i,j));
						all_pieces[i][j] = all_pieces[i][k];
						all_pieces[i][k] = null;
						break;

func fill_columns():
	for i in width:
		for j in height:
			if all_pieces[i][j] == null:
				var rand = floor(rand_range(0,max_num_pieces_per_level));
				var piece = possible_pieces[rand].instance();
				var loops = 0;
				while ( match_at(i,j, piece.color) && loops < 100):
					rand = floor(rand_range(0, max_num_pieces_per_level));
					loops += 1;
					piece = possible_pieces[rand].instance();
				# instance that piece from the array 
				add_child(piece);
				piece.position = grid_to_pixel(i,j);
				all_pieces[i][j] = piece;

# In progress started 5/23/2021 -- implementing level goals and completion routine. 
func check_goal_progress(_score): 
	var BONUS = 0; 
	#default value for matches
	value = 100;
	bonus = 0; 
	BONUS = get_node("/root/Game_Window/Grid/100pts_AnimatedSprite");
	#print(BONUS);
   
	if Global.goal == 1:
		Global.points_1
		Global.minutes_1
		Global.turns_1
		Global.color_1
		Global.type_1
		Global.reward_1
		Global.amount_1
		if (Global.turns_1 <= Global.shots_on_goals):
			value = Global.amount_3;
		if (Global.points_1 <= Global.total_score):
			value = Global.amount_1;
	if Global.goal == 2:
		Global.points_2
		Global.minutes_2
		Global.turns_2
		Global.color_2
		Global.type_2
		Global.reward_2
		Global.amount_2
		if (Global.turns_2 <= Global.shots_on_goals):
			value = Global.amount_3;
		if (Global.points_2 <= Global.total_score):
			value = Global.amount_2;
	if Global.goal == 3:
		Global.points_3
		Global.minutes_3
		Global.turns_3
		Global.color_3
		Global.type_3
		Global.reward_3
		Global.amount_3
		if (Global.turns_3 <= Global.shots_on_goals):
			value = Global.amount_3;
		if (Global.points_3 <= Global.total_score):
			value = Global.amount_3;
			         
			  
	bonus = 0; 
	if(value == 100): 
		BONUS = get_node("/root/Game_Window/Grid/100pts_AnimatedSprite");  
	if(value == 200): 
		BONUS = get_node("/root/Game_Window/Grid/200pts_AnimatedSprite"); 
	if(value == 300): 
		BONUS = get_node("/root/Game_Window/Grid/300pts_AnimatedSprite"); 
	if(value == 400): 
		BONUS = get_node("/root/Game_Window/Grid/400pts_AnimatedSprite"); 
	if(value == 500): 
		BONUS = get_node("/root/Game_Window/Grid/500pts_AnimatedSprite"); 
		
	_score = _score + value + bonus;
	get_parent().get_node("BottomUI/Bottom_Center_RTL").set_text(String(_score)); 
	BONUS.set_frame(1); 
	BONUS.play();  
	return(_score);
########################################################################################

func update_score(pcs_matched, _score, position_of_match): 
	var BONUS = 0; 
	#default value for matches
	value = 100;
	bonus = 0; 
	BONUS = get_node("/root/Game_Window/Grid/100pts_AnimatedSprite");
	#print(BONUS);
	
	#control to increment bonus based on number of piece matched.
	if(pcs_matched == 4):
		value = 200; 
		BONUS = get_node("/root/Game_Window/Grid/200pts_AnimatedSprite");
		#print(BONUS);
	if(pcs_matched == 5):
		value = 300; 
		BONUS = get_node("/root/Game_Window/Grid/300pts_AnimatedSprite");
		#print(BONUS);
	if(pcs_matched == 6):
		value = 400; 
		BONUS = get_node("/root/Game_Window/Grid/400pts_AnimatedSprite");
		#print(BONUS);
	if(pcs_matched == 7):
		value = 500; 
		BONUS = get_node("/root/Game_Window/Grid/500pts_AnimatedSprite");	
		#print(BONUS); 
		
	_score = _score + value + bonus;
	get_parent().get_node("BottomUI/Bottom_Center_RTL").set_text(String(_score)); 
	BONUS.set_frame(1);
	print(position_of_match);
	BONUS.set_position(position_of_match); 
	BONUS.play();  
	return(_score);

func update_shots_on_goal_player_1(pcs_matched, shots_on_goal_player_1): 
	print(pcs_matched);
	print(shots_on_goal_player_1);	
	#control to increment
	if(pcs_matched > 2): 		
		shots_on_goal_player_1 = shots_on_goal_player_1 +1;
		get_parent().get_node("TopUI/Colum_Left/VBoxContainer_ScoreBoard_R2_Left/HBoxContainer/RTL_ShotsOnGoal_Left").set_text(String(shots_on_goal_player_1));  
	return(shots_on_goal_player_1);


func scoreboard_update(): 	
	pass;


func delete_pieces_on_grid():
	clear_2d_array();
	pass;
	
func repopulate_pieces_on_grid():
	all_pieces = make_2d_array();
	spawn_pieces();
	pass;

func _on_Destroy_Timer_timeout(): 
	destroy_matched(); 
	pass;

func _on_Collapse_Timer_timeout():
	collapse_columns(); 	
	pass;

func _on_Fill_Timer_timeout():
	fill_columns(); 
	pass;

func _on_MatchCheck_Timer_timeout():
	var matchcheck = find_matches();	 

func _on_UndoDriver_Timer_timeout(): 
	#print("Function: Undo Driver Timer. ");
	pass;
	
func _on_TextureButton_pressed():
	delete_pieces_on_grid();
	repopulate_pieces_on_grid();
	pass # Replace with function body.	
	
func _read_level_specs():
	var PARENT = get_parent();
	print(PARENT); 
	var NODE = PARENT.get_node("LevelSpecsNode");
	print(NODE); 
	print(Global); 
	var LevelSpecs_LineEntryCount = Global.LevelSpecs_matrix.size()
	#print("LevelSpecs_LineEntryCount: ", LevelSpecs_LineEntryCount);	
	for l in range(LevelSpecs_LineEntryCount):
		#print("l: ",l);
		#print("level: ",level);
		 
		var LevelSpecs_Array = Global.LevelSpecs_matrix[l];
		#print("LevelSpecs_Array: ",LevelSpecs_Array);
		 
		var LevelSpecs_EntryCount = LevelSpecs_Array.size();
		#print("LevelSpecs_EntryCount: ",LevelSpecs_EntryCount);
		 
		var test_level = level;
		#print("test_level: ",test_level);
		
		if LevelSpecs_EntryCount > 2:
			#print("LevelSpecs_EntryCount: ",LevelSpecs_EntryCount); 
			test_level = LevelSpecs_Array[1];
			test_level = int(test_level);
			#print("test_level: ",test_level);
			
		if test_level == level:
			for n in range(LevelSpecs_EntryCount):
				#print(String(l) + ":" + String(n) + ":" + LevelSpecs_Array[n]) # Prints n entry
				if n > 0:
					if test_level == level:
						match n:
							0:
								Global.LS_id = int(LevelSpecs_Array[n]);
							1:
								var temp_level= int(LevelSpecs_Array[n]);
							2:
								Global.LS_width = int(LevelSpecs_Array[n]);
							3:
								Global.LS_height= int(LevelSpecs_Array[n]);
							4:
								Global.goal= int(LevelSpecs_Array[n]);
							5:
								if Global.goal == 1:
									Global.points_1 = int(LevelSpecs_Array[n]);
								if Global.goal == 2:
									Global.points_2 = int(LevelSpecs_Array[n]);
								if Global.goal == 3:
									Global.points_3 = int(LevelSpecs_Array[n]);
							6: 
								if Global.goal == 1:
									Global.minutes_1 = int(LevelSpecs_Array[n]);
									Global.minutes = Global.minutes_1;
								if Global.goal == 2:
									Global.minutes_2 = int(LevelSpecs_Array[n]);
									Global.minutes = Global.minutes_2;
								if Global.goal == 3:
									Global.minutes_3 = int(LevelSpecs_Array[n]);
									Global.minutes = Global.minutes_3;
							7:
								if Global.goal == 1:
									Global.turns_1 = int(LevelSpecs_Array[n]);
								if Global.goal == 2:
									Global.turns_2 = int(LevelSpecs_Array[n]);
								if Global.goal == 3:
									Global.turns_3 = int(LevelSpecs_Array[n]); 
							8:
								if Global.goal == 1:
									Global.color_1 = int(LevelSpecs_Array[n]);
								if Global.goal == 2:
									Global.color_2 = int(LevelSpecs_Array[n]);
								if Global.goal == 3:
									Global.color_3 = int(LevelSpecs_Array[n]); 
							9:
								if Global.goal == 1:
									Global.type_1 = int(LevelSpecs_Array[n]);
								if Global.goal == 2:
									Global.type_2 = int(LevelSpecs_Array[n]);
								if Global.goal == 3:
									Global.type_3 = int(LevelSpecs_Array[n]); 
							10:
								if Global.goal == 1:
									Global.reward_1 = int(LevelSpecs_Array[n]);
								if Global.goal == 2:
									Global.reward_2 = int(LevelSpecs_Array[n]);
								if Global.goal == 3:
									Global.reward_3 = int(LevelSpecs_Array[n]); 
							11:
								if Global.goal == 1:
									Global.amount_1 = int(LevelSpecs_Array[n]);
								if Global.goal == 2:
									Global.amount_2 = int(LevelSpecs_Array[n]);
								if Global.goal == 3:
									Global.amount_3 = int(LevelSpecs_Array[n]); 
	
