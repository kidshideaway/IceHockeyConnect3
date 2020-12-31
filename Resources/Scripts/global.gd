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

################### Timer Variables ##########################
var minutes = 20;
var seconds = 03;
const TIME_PERIOD = 1; # 500ms
var time = 0;
var status = 0;
var timesup = 0;
var animation_speed = 1;
var end_buffer = 30;
onready var RTL_MINUTES_TENS = get_node("TopUI/Colum_Middle/VBoxContainer_ScoreBoard_Middle/HBoxContainer/TIMER_Digit_Minutes_Tens");
onready var RTL_MINUTES_ONES = get_node("TopUI/Colum_Middle/VBoxContainer_ScoreBoard_Middle/HBoxContainer/TIMER_Digit_Minutes_Ones");
onready var RTL_SECONDS_TENS = get_node("TopUI/Colum_Middle/VBoxContainer_ScoreBoard_Middle/HBoxContainer/TIMER_Digit_Seconds_Tens");
onready var RTL_SECONDS_ONES = get_node("TopUI/Colum_Middle/VBoxContainer_ScoreBoard_Middle/HBoxContainer/TIMER_Digit_Seconds_Ones");
 
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
 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
