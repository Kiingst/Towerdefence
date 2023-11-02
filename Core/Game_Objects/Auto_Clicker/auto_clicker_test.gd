extends Node2D
signal clicked
var selected = false
var selected_upgrades = false

var selectable_class_file =  preload("res://Core/Game_Objects/classes/Selected_class.gd")
var upgrade_class
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.
	upgrade_class = selectable_class_file.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("Right_Click"):
		selected = false
		#remove_from_group("selected")
	if Input.is_action_just_released("Left_Click"):
		selected_upgrades = false
		
	
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)



func _on_clicking_area_input_event(viewport, event, shape_idx):
	if get_tree().get_nodes_in_group("Base_Level")[0].build_mode == false:
	
		if Input.is_action_pressed("Right_Click"):
			selected = true
			#add_to_group("selected")
	
		if Input.is_action_pressed("Left_Click"):
			selected_upgrades = true
			get_tree().call_group("selected", "remove_from_selected")
			add_to_group("selected")


func click(clickable):
	clickable.get_parent().clicked()
	#print("clicked ", clickable)

func _on_click_timer_timeout():
	var clickables = $Clicking_Area.get_overlapping_areas()
	if clickables.size() > 0:
		for i in clickables.size():
			if clickables[i].get_parent().has_method('clicked'):
				click(clickables[i])
				
