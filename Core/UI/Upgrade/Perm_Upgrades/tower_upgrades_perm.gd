extends Control
#script is for getting upgradeable items from the selected tower and putting the upgrade out visually
signal back_button

var current_tower = 0
var upgrade_template = preload("res://Core/UI/Upgrade/Perm_Upgrades/upgrade_1.tscn")
var upgrades
var baselevel
var Tower_data
@onready var grid = $VBoxContainer/HBoxContainer/GridContainer


func _ready():
	#remove the template nodes
	clear_upgrade_hud()
	
	
	
	



func _process(delta):
	Tower_data = get_tree().get_nodes_in_group("Base_Level")[0].get_node("Tower_Data")
	baselevel = get_tree().get_nodes_in_group("Base_Level")[0]


func _on_back_button_pressed():
	emit_signal("back_button")


func _on_tower_1_pressed():
	change_tower(Tower_data.tower1)
		


func _on_upgrade_button_presses():
	pass # Replace with function body.

func display_upgrades(tower):
	clear_upgrade_hud()
	pass
	
	for i in tower.upgrades.size():
		var x = upgrade_template.instantiate()
		#x.upgrade = tower.upgrades[i]
		x.display_upgrade(tower.upgrades[i])
		grid.add_child(x)
		


func clear_upgrade_hud():
	var x = $VBoxContainer/HBoxContainer/GridContainer.get_children()
	for i in x.size():
		$VBoxContainer/HBoxContainer/GridContainer.remove_child(x[i])

func change_tower(tower):
	if current_tower == tower.tower_id:
		pass
	else:
		display_upgrades(tower)
