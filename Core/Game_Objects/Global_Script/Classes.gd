extends Node


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# each upgrade will have a name

class upgrade:
	#member variables
	var names : String
	var base_price : float
	var multiplier: float
	var id : int
	var level: int = 0
	
	#base_num multiplier level
	var upgrade_data: Array
	
	func _init(name1, price, multiplier1, upgrade_data1, id1 = 0):
		names = name1
		base_price = price
		multiplier = multiplier1
		id = id1
		upgrade_data = upgrade_data1
		
	
	func get_price():
		return snapped(base_price * pow(multiplier, level), 0.01)
		
	
	func buy_upgrade():
		if GlobalVars.money >= get_price():
			level += 1
			Signals.emit_signal("UpgradeBought", self)
			GlobalVars.money -= get_price()
			GlobalVars.money = snapped(GlobalVars.money, 0.01)
		
		
	
	func get_upgrade_data():
		return snapped(upgrade_data[0] * pow(upgrade_data[1], level), 0.01)
	




class tower:
	var upgrades : Array
	var current_id = 1
	var max_ammo = 10
	var reload_timer = 1.0
	var tower_damage = 1.0
	var ammo_increment = 1.0
	var money_per_kill = 1
	var attack_range = 250
	
	var base_price: float
	var multiplier: float
	var level = 0
	
	var tower_id : int
	
	var packed_scene : PackedScene
	
	func _init(base_price1, multiplier1,tower_id1,tower_scene1, upgrades1  = [], ):
		for i in upgrades1.size():
			upgrades1[i].id = current_id
			current_id += 1
		
		upgrades = upgrades1
		packed_scene = tower_scene1
		base_price = base_price1
		multiplier = multiplier1
		tower_id = tower_id1
	
	func add_upgrade(upgrade):
		upgrade.id = current_id
		current_id += 1
		upgrades.append(upgrades)
	
	func get_upgrades():
		var x = ""
		for i in upgrades.size():
			x += upgrades[i].names + " id is " + str(upgrades[i].id) + ", "
		return x
	
	func get_price():
		#print(base_price, " * ", "(", multiplier, ")", "^" ,level)
		return snapped(base_price * pow(multiplier, level), 0.01)
