extends Node2D

#var TITLESCREEN = load("res://Resources/Scenes/TitleScreen.tcsn"); 
#var SCOREGUI = load("res://Resources/Scenes/ScoreGUI.tscn"); 
#var OPTIONSGUI = load("res://Resources/Scenes/OptionsGUI.tscn"); 
#var GAMEMENU = load("res://Resources/Scenes/GameMenu.tscn");  
#level db rules
var LEVELSPECNODE = load("res://Resources/Scripts/LevelSpecsNode.gd");
var total_score = 0;
var score = 0;
var goal_points = 0;
var goal_seconds = 0;
var goal_type = 0;
var coins = 0;

var game_goals = [];
var level_goals = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	pass # Replace with function body.

 


func _on_TextureButton_pressed():
	var Grid = get_node("Grid")
	Grid._on_TextureButton_pressed();
	pass # Replace with function body.
