extends Node2D 

@onready var parent = get_node("/root");  
@onready var Global = get_node("/root/Global");    
@onready var GameWindowNode = parent.get_node("GameWindowNode"); 
@onready var PieceNode = parent.get_node("Piece");  
@onready var Reg_Blue_Piece = parent.get_node("Reg_Blue_Piece");   
@onready var Reg_Chartuse_Piece = parent.get_node("Reg_Chartuse_Piece");  
@onready var Reg_Green_Piece = parent.get_node("Reg_Green_Piece");  
@onready var Reg_LiteGreen_Piece = parent.get_node("Reg_LiteGreen_Piece");  
@onready var Reg_LiteOrange_Piece = parent.get_node("Reg_LiteOrange_Piece");  
@onready var Reg_LitePink_Piece = parent.get_node("Reg_LitePink_Piece");  
@onready var Reg_Orange_Piece = parent.get_node("Reg_Orange_Piece");  
@onready var Reg_Pink_Piece = parent.get_node("Reg_Pink_Piece");  
@onready var Reg_Purple_Piece = parent.get_node("Reg_Purple_Piece");  
@onready var Reg_Rainbow_Piece = parent.get_node("Reg_Rainbow_Piece");  
@onready var Reg_Yellow_Piece = parent.get_node("Reg_Yellow_Piece");   

@export var color: String; 
var matched = false;

# Called when the node enters the scene tree for the first time.
func _ready(): 
	print("parent", parent) 	 
	print("GameWindowNode", GameWindowNode)
	print("PieceNode", PieceNode)	   
	print("PieceNode", PieceNode)	

func move(target):	
	var Move_Tween = get_tree().create_tween()
	#Move_Tween.tween_property(self, "modulate", Color.RED, 1)
	#Move_Tween.tween_property(self, "scale", Vector2(), 1) 
	#Move_Tween.tween_property(self, "position", Vector2(0, 0), 1)
	Move_Tween.interpolate_property(self, "position", position, target, .3, Tween.TRANS_SINE, Tween.EASE_OUT);
	Move_Tween.tween_callback(move)
	Move_Tween.start();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func dim():
	var sprite = get_node("Sprite");
	sprite.modulate = Color(1,1,1,.5); 
	pass;

func coloris():
	var ColorData = 0
	var _self = "/root/Piece";
	var child_count = get_child_count();
	for aaa in range (0, child_count):
		var child = get_child(aaa);
		if child is Sprite2D:
			print("This is a sprite");   
			ColorData = child.get_node("metadata/color")
	return(ColorData) 
