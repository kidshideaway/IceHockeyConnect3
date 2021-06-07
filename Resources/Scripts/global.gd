extends Node

onready var Global = get_node("/root/Global"); 

var LEVELSPECNODE = load("res://Resources/Scripts/LevelSpecsNode.gd");
var total_score = 0;
var goal_points = 0;
var goal_seconds = 0;
var goal_type = 0;
var coins = 0;
var game_goals = [];
var level_goals = [];
var shots_on_goal_player_1 = 0;

################### Timer Variables ##########################
var minutes = 20;
var seconds = 03;
const TIME_PERIOD = 1; # 500ms
var time = 0;
var status = 0;
var timesup = 0;
var animation_speed = 1;
var end_buffer = 30;

# Touch variables
var first_touch = Vector2(0,0);
var final_touch = Vector2(0,0);
var controlling = false;
var max_num_pieces_per_level = 4;

# variables for tracking score, cash, and other player based values.
var silvercoins_dig_thousands = 0;
var silvercoins_dig_hundreds = 0;
var silvercoins_dig_tens = 0;
var silvercoins_dig_ones = 0;
var coppercoins_dig_thousands = 0;
var coppercoins_dig_hundreds = 0;
var coppercoins_dig_tens = 0;
var coppercoins_dig_ones = 0;
var timer_dig_min_tens = 0;
var timer_dig_min_ones = 0;
var timer_dig_sec_tens = 0;
var timer_dig_sec_ones = 0;
var shots_on_goals = 0;

# the database fields
var goal;
var points;
var turns;
var color;
var type;
var reward;
var amount;

# the active goals per level (3 sets)
var points_1;
var minutes_1;
var turns_1;
var color_1;
var type_1;
var reward_1;
var amount_1;

##
var points_2;
var minutes_2;
var turns_2;
var color_2;
var type_2;
var reward_2;
var amount_2;

###
var points_3;
var minutes_3;
var turns_3;
var color_3;
var type_3;
var reward_3;
var amount_3;

#Language Labels <-- load from language database in future
#####
var DB_lang_SilverLabel = "Silver"
var DB_lang_CopperLabel = "Copper"
var DB_lang_PenaltyLabel = "Penalty"
var DB_lang_ShotsOnGoalLabel = "Shots On Goal"
#####

#####
var LevelSpecs 
var LevelSpecs_matrix = []
var LevelSpecs_Array
var LS_id
var LS_width
var LS_height
##### 

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Global variable file: ");
	print(Global);
	print(LEVELSPECNODE);
	print(LevelSpecs);
	print(LevelSpecs_matrix);
	print(LevelSpecs_Array);
	print(LS_id);
	print(LS_width);
	print(LS_height);
	print(total_score);
	print(goal_points);
	print(goal_seconds);
	print(goal_type);
	print(coins);
	print(game_goals);
	print(level_goals); # Prints n entry	
	print(minutes);
	print(seconds);
	print(TIME_PERIOD);
	print(time);
	print(status);
	print(timesup);
	print(end_buffer);
	print(animation_speed ); # Prints n entry	 
	print(first_touch);
	print(final_touch);
	print(controlling);
	print( max_num_pieces_per_level ) # Prints n entry	
	print(silvercoins_dig_thousands);
	print(silvercoins_dig_hundreds);
	print(silvercoins_dig_tens);
	print(silvercoins_dig_ones ); # Prints n entry	 	
	print(coppercoins_dig_thousands);
	print(coppercoins_dig_hundreds);
	print(coppercoins_dig_tens);
	print(coppercoins_dig_ones ); # Prints n entry	 	
	print(timer_dig_min_tens);
	print(timer_dig_min_ones);
	print(timer_dig_sec_tens);
	print(timer_dig_sec_ones) # Prints n entry	 	
	print(shots_on_goals); 
	print(shots_on_goal_player_1); 
	print(goal);
	print(type);
	print(points);
	print(turns);
	print(color);
	print(reward);
	print(amount) # Prints n entry	 	
	print(turns_1);
	print(type_1);
	print(points_1 );
	print(minutes_1);
	print(color_1);
	print(reward_1);
	print(amount_1) # Prints n entry	 	
	print(turns_2);
	print(type_2);
	print(points_2);
	print(minutes_2);
	print(color_2);
	print(reward_2);
	print(amount_2); # Prints n entry
	print(turns_3);
	print(type_3);
	print(points_3);
	print(minutes_3);
	print(color_3);
	print(reward_3);
	print(amount_3); # Prints n entry
	print(DB_lang_SilverLabel);
	print(DB_lang_CopperLabel);
	print(DB_lang_PenaltyLabel);
	print(DB_lang_ShotsOnGoalLabel );
	print("--- END --- Global variable file "); 

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
