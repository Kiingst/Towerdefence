extends Node2D
var Money = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var format_string = "Gold %s"
	$UI/Hud/VBoxContainer/Money_Count.set_text(format_string % Money)  


