extends Node2D
signal clicked
var selected = false
var selected_upgrades = false
# Called when the node enters the scene tree for the first time.



#Upgrade data syntax
# "Upgrade" = ["Upgrade_text", "Cost", "Code"]

var current_upgrade_value = 1
var tower_name = "Auto Clicker"

var upgrade1_data  = {
	"1" = ["clciker", "10" ,"player.double_fire = true"],
	"2" = ["Extented Range", "100" ,"player/Attack_Range/CollisionShape2D.radius += 50"],
	"3" = ["Rapid Fire", "100000" ,"player.reload_timer = 0.1"]

}
var upgrade2_data  = {
	"1" = ["clicks ", "15" ,"player.penetrating_bullets = true"],
	"2" = ["Infinite ammo", "300" ,"player.inf_ammo = true"],
	"3" = [" Quad Fire ", "300000" ,"player.quad_fire = true"]

}
var upgrade3_data  = {
	"1" = ["fast", "13.5" ,"player.money_per_kill += 1"],
	"2" = ["homimg bullets", "500" ,"player.homing_bullet = true"],
	"3" = ["100 Extra Money Per Kill", "1000000" ,"player.money_per_kill += 100"]
}

var upgrade_array = [upgrade1_data, upgrade2_data, upgrade3_data]


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("Right_Click"):
		selected = false
		#remove_from_group("selected")
	if Input.is_action_just_released("Left_Click"):
		selected_upgrades = false
		
	
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
			get_tree().call_group("selected", "remove_from_selected")
			add_to_group("selected")

func remove_from_selected():
	remove_from_group("selected")
