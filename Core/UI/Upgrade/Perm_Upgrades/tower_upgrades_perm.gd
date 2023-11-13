extends Control
#script is for getting upgradeable items from the selected tower and putting the upgrade out visually
signal back_button

var current_tower = null
var upgrade_template = preload("res://Core/UI/Upgrade/Perm_Upgrades/upgrade_1.tscn")
var upgrades
var baselevel
@onready var grid = $VBoxContainer/HBoxContainer/GridContainer


func _ready():
	#remove the template nodes
	clear_upgrade_hud()
	
	
	
	



func _process(delta):
	upgrades = get_tree().get_nodes_in_group("Base_Level")[0].get_node("Upgrades")
	baselevel = get_tree().get_nodes_in_group("Base_Level")[0]


func _on_back_button_pressed():
	emit_signal("back_button")


func _on_tower_1_pressed():
		display_upgrades(upgrades.tower1)
		current_tower = 1

func upgrade_buy(upgrade_type, price, upgrade_table):
	if baselevel.money > price:
		print("bought upgrade " , upgrade_type[0])
		baselevel.money -= price
		#apply upgrade
		
		#next price
		var key = upgrade_table.find_key(upgrade_type)
		
		upgrades.tower1_current_upgrade[key] += 1
		print(upgrades.tower1_current_upgrade[key])
		#clear_upgrade_hud()
		_on_tower_1_pressed()


func _on_upgrade_button_presses():
	pass # Replace with function body.

func display_upgrades(tower_upgrades):
	clear_upgrade_hud()
	for i in tower_upgrades.size():
		var upgrade = tower_upgrades.get(str(i))
		#print(upgrade)
		var x = upgrade_template.instantiate()
		x.upgrade_type = upgrade
		var labels = x.get_child(0).get_child(0).get_child(0).get_children()
		#print(labels)
		labels[0].text = upgrade[0] + " " + str(upgrade[1])
		labels[2].text = str(upgrade[2])
		
		var button = x.get_child(0).get_child(0).get_child(1)
		
		button.text = "Buy " + str(upgrade[1]) + "$"
		x.price = upgrade[1]
		x.upgrade_table = tower_upgrades
		x.connect("button_press",Callable(self,"upgrade_buy"))
		grid.add_child(x)
		

func return_current_tower_upgrade_level(number):
	match number:
		1:
			return upgrades.tower1_current_upgrade
	

func clear_upgrade_hud():
	var x = $VBoxContainer/HBoxContainer/GridContainer.get_children()
	for i in x.size():
		$VBoxContainer/HBoxContainer/GridContainer.remove_child(x[i])
