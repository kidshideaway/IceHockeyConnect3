extends Node2D

export (String) var color;
var Move_Tween; 
var matched = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	Move_Tween = get_node("Move_Tween");

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
