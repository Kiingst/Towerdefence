extends Control
#script is for getting upgradeable items from the selected tower and putting the upgrade out visually
signal back_button

var current_tower = null
var upgrade_template = preload("res://Core/UI/Upgrade/Perm_Upgrades/upgrade_1.tscn")
var upgrades 
@onready var grid = $VBoxContainer/HBoxContainer/GridContainer


func _ready():
	#remove the template nodes
	var x = $VBoxContainer/HBoxContainer/GridContainer.get_children()
	for i in x.size():
		$VBoxContainer/HBoxContainer/GridContainer.remove_child(x[i])
	
	
	
	



func _process(delta):
	upgrades = get_tree().get_nodes_in_group("Base_Level")[0].get_node("Upgrades")


func _on_back_button_pressed():
	emit_signal("back_button")


func _on_tower_1_pressed():
	if current_tower != 1:
		display_upgrades(upgrades.tower1)
		current_tower = 1



func _on_upgrade_button_presses():
	pass # Replace with function body.

func display_upgrades(tower_upgrades):
	for i in tower_upgrades.size():
		var upgrade = tower_upgrades.get(str(i))
		print(upgrade)
		var x = upgrade_template.instantiate()
		var labels = x.get_child(0).get_child(0).get_child(0).get_children()
		print(labels)
		labels[0].text = upgrade[0] + " " + str(upgrade[1])
		labels[2].text = str(upgrade[2])
		
		grid.add_child(x)
		
