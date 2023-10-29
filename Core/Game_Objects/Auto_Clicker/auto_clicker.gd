extends Node2D
signal clicked
var selected = false
var selected_upgrades = false
# Called when the node enters the scene tree for the first time.



#Upgrade data syntax
# "Upgrade" = ["Upgrade_text", "Cost", "Code"]

var current_upgrade_value = [1,1,1]
var tower_name = "Auto Clicker"

var upgrade1_data  = {
	"1" = ["Clicker", "10" ,"player.move_speed += 100"],
	"2" = ["res://icon.svg", "100" ,"player.move_speed += 100"],
	"3" = ["res://icon.svg", "100000" ,"player.move_speed += 100"]

}
var upgrade2_data  = {
	"1" = ["clciky ", "15" ,"player.move_speed += 100"],
	"2" = ["res://icon.svg", "300" ,"player.move_speed += 100"],
	"3" = ["res://icon.svg", "300000" ,"player.move_speed += 100"]

}
var upgrade3_data  = {
	"1" = [" clocked", "13.5" ,"player.move_speed += 100"],
	"2" = ["res://icon.svg", "500" ,"player.move_speed += 100"],
	"3" = ["res://icon.svg", "1000000" ,"player.move_speed += 100"]
}


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("Right_Click"):
		selected = false
		#remove_from_group("selected")
	if Input.is_action_just_released("Left_Click"):
		selected_upgrades = false
		remove_from_group("selected")
	
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)



func _on_click_timer_timeout():
	var clickables = $Clicking_Area.get_overlapping_areas()
	if clickables.size() > 0:
		for i in clickables.size():
			if clickables[i].get_parent().has_method('clicked'):
				click(clickables[i])
				


func click(clickable):
	clickable.get_parent().clicked()
	#print("clicked ", clickable)
	


func _on_clicking_area_input_event(viewport, event, shape_idx):
	if get_tree().get_nodes_in_group("Base_Level")[0].build_mode == false:
	
		if Input.is_action_pressed("Right_Click"):
			selected = true
			#add_to_group("selected")
	
		if Input.is_action_pressed("Left_Click"):
			selected_upgrades = true
			add_to_group("selected")
