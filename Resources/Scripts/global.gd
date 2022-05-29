extends Node

onready var Global = get_node("/root/Global"); 

var LEVELSPECNODE = load("res://Resources/Scripts/LevelSpecsNode.gd"); 
var goal_points = 0;
var goal_seconds = 0;
var goal_type = 0; 
var game_goals = [];
var level_goals = [];
var current_total_score = 0;
var current_shots_on_goal = 0;
var current_coins = 0; 
var current_level = 0;

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
var silvercoins = 0; 
var coppercoins = 0;  
var shots_on_goal = 0;

# the database fields
var level_round_goal;
var level_round_points;
var level_round_turns;
var level_round_color;
var level_round_type;
var level_round_reward;
var level_round_amount; 
var level_round_minutes;
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
	print("Global: ", Global);
	print("current_level: ", current_level);
	print("LEVELSPECNODE: ", LEVELSPECNODE);
	print("LevelSpecs: ", LevelSpecs);
	print("LevelSpecs_matrix: ", LevelSpecs_matrix);
	print("LevelSpecs_Array: ", LevelSpecs_Array);
	print("LS_id: ", LS_id);
	print("LS_width: ", LS_width);
	print("LS_height: ", LS_height);
	print("current_total_score: ", current_total_score);
	print("goal_points: ", goal_points);
	print("goal_seconds: ", goal_seconds);
	print("goal_type: ", goal_type);
	print("silvercoins: ", silvercoins);
	print("coppercoins: ", coppercoins);
	print("game_goals: ", game_goals);
	print("level_goals: ", level_goals); # Prints n entry	
	print("minutes: ", minutes);
	print("seconds: ", seconds);
	print("TIME_PERIOD: ", TIME_PERIOD);
	print("time: ", time);
	print("status: ", status);
	print("timesup: ", timesup);
	print("end_buffer: ", end_buffer);
	print("animation_speed: ", animation_speed ); # Prints n entry	 
	print("first_touch: ", first_touch);
	print("final_touch: ", final_touch);
	print("controlling: ", controlling);
	print("max_num_pieces_per_level: ", max_num_pieces_per_level ) # Prints n entry	
	print("current_shots_on_goal: ",current_shots_on_goal); 
	print("shots_on_goal: ",shots_on_goal); 
	print("level_round_goal: ",level_round_goal);
	print("level_round_type: ",level_round_type);
	print("level_round_points: ",level_round_points);
	print("level_round_turns: ",level_round_turns);
	print("level_round_color: ",level_round_color);
	print("level_round_reward: ",level_round_reward);
	print("level_round_amount: ",level_round_amount);   
	print("--- END --- Global variable file "); 

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
