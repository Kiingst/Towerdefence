extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_tree().get_nodes_in_group("selected").size() > 0:
		display_upgrades(get_tree().get_nodes_in_group("selected")[0])

func display_upgrades(node):
	var temp_string = "%s"
	var temp_name = "Upgrades for %s"
	$VBoxContainer/Top_Margin/Upgrade_Label.set_text(temp_name % node.tower_name)
	$VBoxContainer/Upgrade_Buttons/Upgrade1.set_text(node.upgrade1_data.get(temp_string % node.current_upgrade_value[0])[0])
	$VBoxContainer/Upgrade_Buttons/Upgrade2.set_text(node.upgrade2_data.get(temp_string % node.current_upgrade_value[1])[0])
	$VBoxContainer/Upgrade_Buttons/Upgrade3.set_text(node.upgrade3_data.get(temp_string % node.current_upgrade_value[2])[0])
