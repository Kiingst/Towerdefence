extends Control
signal button_pressed
var current_node 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_tree().get_nodes_in_group("selected").size() > 0:
		display_upgrades(get_tree().get_nodes_in_group("selected")[0])
		

func display_upgrades(node):
	current_node = node
	var temp_string = "%s"
	var temp_name = "Upgrades for %s"
	$VBoxContainer/Top_Margin/Upgrade_Label.set_text(temp_name % node.tower_name)
	$VBoxContainer/Upgrade_Buttons/Upgrade1.set_text(node.upgrade1_data.get(temp_string % node.current_upgrade_value)[0])
	$VBoxContainer/Upgrade_Buttons/Upgrade2.set_text(node.upgrade2_data.get(temp_string % node.current_upgrade_value)[0])
	$VBoxContainer/Upgrade_Buttons/Upgrade3.set_text(node.upgrade3_data.get(temp_string % node.current_upgrade_value)[0])

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
	
func button_pressed1(button):
	emit_signal("button_pressed", button)
	#current_node.current_upgrade_value +=1
	
