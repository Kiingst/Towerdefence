extends Control
signal tower_builder_button_pressed
signal upgrade_button_pressed
var tower_selected

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
	$VBoxContainer/Top_Margin.visible = true
	$VBoxContainer/Bottom_margin.visible = true
	
	disable_middle_area()
	

func upgrade_tab():
	normal_tab()
	$VBoxContainer/Top_Margin.visible = false
	$VBoxContainer/Top_Bar.visible = true
	$VBoxContainer/Top_Buttons.visible = false
	$VBoxContainer/Tower_Builder.visible = false
	$VBoxContainer/Bottom_margin.visible = false


func _on_tower_builder_tower_builder_button_pressed(price , tower):
	emit_signal("tower_builder_button_pressed" , price , tower)
	


func _on_upgrade_node_button_pressed(node , number):
	emit_signal("upgrade_button_pressed" , node, number)
	


func _on_upgrade_node_show_upgrades():
	upgrade_tab()
	
	$VBoxContainer/Middle_area/Upgrade_node.visible = true


func _on_tower_upgrades_pressed():
	#print("pressing button")
	upgrade_tab()
	
	clear_selected()
	
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


func _on_back_button_pressed():
	print("pressing back button")
	clear_selected()
	normal_tab()
	

func clear_selected():
	var x = get_tree().get_nodes_in_group("selected")
	
	if x.size() > 0:
		for i in x.size():
			x[i].remove_from_selected()

