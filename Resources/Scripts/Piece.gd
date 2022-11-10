extends Node2D 

onready var parent =  get_tree().get_root().get_node(".") 
onready var Global = parent.get_node("Global");  
onready var GameWindowNode = parent.get_node("GameWindowNode"); 
onready var PieceNode = parent.get_node("Piece"); 
onready var Move_Tween = parent.get_node("Piece/Move_Tween"); 
onready var Reg_Blue_Piece = parent.get_node("Reg_Blue_Piece");   
onready var Reg_Chartuse_Piece = parent.get_node("Reg_Chartuse_Piece");  
onready var Reg_Green_Piece = parent.get_node("Reg_Green_Piece");  
onready var Reg_LiteGreen_Piece = parent.get_node("Reg_LiteGreen_Piece");  
onready var Reg_LiteOrange_Piece = parent.get_node("Reg_LiteOrange_Piece");  
onready var Reg_LitePink_Piece = parent.get_node("Reg_LitePink_Piece");  
onready var Reg_Orange_Piece = parent.get_node("Reg_Orange_Piece");  
onready var Reg_Pink_Piece = parent.get_node("Reg_Pink_Piece");  
onready var Reg_Purple_Piece = parent.get_node("Reg_Purple_Piece");  
onready var Reg_Rainbow_Piece = parent.get_node("Reg_Rainbow_Piece");  
onready var Reg_Yellow_Piece = parent.get_node("Reg_Yellow_Piece");   

export (String) var color; 
var matched = false;

# Called when the node enters the scene tree for the first time.
func _ready(): 
	print("parent", parent) 	 
	print("GameWindowNode", GameWindowNode)
	print("PieceNode", PieceNode)	 
	Move_Tween = PieceNode.get_node("Move_Tween")
	print("Move_Tween", Move_Tween)	

func move(target):
	Move_Tween.interpolate_property(self, "position", position, target, .3, Tween.TRANS_SINE, Tween.EASE_OUT);
	Move_Tween.start();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func dim():
	var sprite = get_node("Sprite");
	sprite.modulate = Color(1,1,1,.5);
	pass;
