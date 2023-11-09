extends Control
signal tower_builder_button_pressed
signal upgrade_button_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	normal_tab()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func normal_tab():
	$VBoxContainer/Top_Bar.visible = true
	$VBoxContainer/Top_Buttons.visible = true
	$VBoxContainer/Tower_Builder.visible = true
	
	disable_middle_area()


func _on_tower_builder_tower_builder_button_pressed(price , tower):
	emit_signal("tower_builder_button_pressed" , price , tower)
	


func _on_upgrade_node_button_pressed(node , number):
	emit_signal("upgrade_button_pressed" , node, number)
	


func _on_upgrade_node_show_upgrades():
	normal_tab()
	
	$VBoxContainer/Middle_area/Upgrade_node.visible = true


func _on_tower_upgrades_pressed():
	print("pressing button")
	normal_tab()
	print("upgrade area visiblity is ", $VBoxContainer/Middle_area/Upgrade_node.visible)
	$VBoxContainer/Middle_area/Tower_Upgrades.visible = true
	


func disable_middle_area():
	var x = $VBoxContainer/Middle_area.get_children()
	for i in x.size():
		x[i].visible = false 
		
		if x[i].has_method("is_old_node"):
			#x[i].saved = null
			pass


func _on_enemy_upgrades_pressed():
	pass # Replace with function body.


func _on_tower_mangers_pressed():
	pass # Replace with function body.


func _on_progression_pressed():
	pass # Replace with function body.


func _on_clicker_upgrades_pressed():
	pass # Replace with function body.


func _on_rebirth_shop_pressed():
	pass # Replace with function body.
