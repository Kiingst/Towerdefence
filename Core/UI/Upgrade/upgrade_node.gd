extends Control
signal button_pressed
var current_node 
signal show_upgrades
var saved = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_tree().get_nodes_in_group("selected").size() > 0:
		display_upgrades(get_tree().get_nodes_in_group("selected")[0])
		

func display_upgrades(node):
	if is_old_node(node):
		saved = node
	else:
		emit_signal("show_upgrades")
		saved = node
	
	current_node = node
	var temp_string = "%s cost %s"
	#var format_string = "{upg} cost {cost}"
	var temp_name = "Upgrades for %s"
	$VBoxContainer/Top_Margin/Upgrade_Label.set_text(temp_name % node.tower_name)
	var upgrade = node.upgrade1_data.get(str(node.current_upgrade_value))
	var temp_string_formated = temp_string % [upgrade[0], upgrade[1]]
	$VBoxContainer/Upgrade_Buttons/Upgrade1.set_text(temp_string_formated)
	upgrade = node.upgrade2_data.get(str(node.current_upgrade_value))
	temp_string_formated = temp_string % [upgrade[0], upgrade[1]]
	$VBoxContainer/Upgrade_Buttons/Upgrade2.set_text(temp_string_formated)
	upgrade = node.upgrade3_data.get(str(node.current_upgrade_value))
	temp_string_formated = temp_string % [upgrade[0], upgrade[1]]
	$VBoxContainer/Upgrade_Buttons/Upgrade3.set_text(temp_string_formated)

# emiting signal for func in base_level gd order should be (func_name, node, whichupgrade)
func _on_upgrade_1_pressed():
	emit_signal("button_pressed", current_node, 1)
	#current_node.current_upgrade_value +=1


func _on_upgrade_2_pressed():
	emit_signal("button_pressed", current_node, 2)
	#current_node.current_upgrade_value +=1


func _on_upgrade_3_pressed():
	emit_signal("button_pressed", current_node, 3)
	#current_node.current_upgrade_value +=1
	

func is_old_node(node):
	if node == saved:
		return true
	else:
		return false
