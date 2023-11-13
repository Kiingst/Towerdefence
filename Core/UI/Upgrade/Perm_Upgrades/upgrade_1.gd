extends MarginContainer
signal button_press
var upgrade_type 
var price 
var upgrade_table

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	emit_signal("button_press", upgrade_type, price, upgrade_table)
	
