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
	
	func _init(name1, price, multiplier1, upgrade_data1, id1):
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

	
	func get_upgrade_data(x = 0):
		if x == 0:
			return snapped(upgrade_data[0] * pow(upgrade_data[1], level), 0.01)
		else:
			return snapped(upgrade_data[0] * pow(upgrade_data[1], level + 1), 0.01)
	




class tower:
	var upgrades : Array
	var max_ammo 
	var reload_timer 
	var tower_damage 
	var ammo_increment 
	var money_per_kill 
	var attack_range 
	
	
	var base_price: float
	var multiplier: float
	var level = 0
	
	var tower_id : int
	
	var packed_scene : PackedScene
	
	func _init(base_price1, multiplier1,tower_id1,tower_scene1, upgrades1  = [], ):
		for i in upgrades1.size():
			apply_upgrades(upgrades1[i])
		
		Signals.UpgradeBought.connect(apply_upgrades)
		upgrades = upgrades1
		packed_scene = tower_scene1
		base_price = base_price1
		multiplier = multiplier1
		tower_id = tower_id1
	
	func add_upgrade(upgrade):
		upgrades.append(upgrade)
	
	func get_upgrades():
		var x = ""
		for i in upgrades.size():
			x += upgrades[i].names + " id is " + str(upgrades[i].id) + ", "
		return x
	
	func get_price():
		return snapped(base_price * pow(multiplier, level), 0.01)
	
	func init_data():
		pass
	
	func apply_upgrades(upgrade):
		#matches upgrade and applies the new value based on upgrade scaling 
		match upgrade.id:
			0:
				print("max ammo was ", max_ammo, " is now ", upgrade.get_upgrade_data())
				max_ammo = upgrade.get_upgrade_data()
				
			1:
				print("reload_timer was ", reload_timer, " is now ", upgrade.get_upgrade_data())
				reload_timer = upgrade.get_upgrade_data()
			2:
				print("tower_damage was ", tower_damage, " is now ", upgrade.get_upgrade_data())
				tower_damage = upgrade.get_upgrade_data()
			3:
				print("ammo_increment was ", ammo_increment, " is now ", upgrade.get_upgrade_data())
				ammo_increment = upgrade.get_upgrade_data()
			4:
				print("money_per_kill was ", money_per_kill, " is now ", upgrade.get_upgrade_data())
				money_per_kill = upgrade.get_upgrade_data()
			5:
				print("attack_range was ", attack_range, " is now ", upgrade.get_upgrade_data())
				attack_range = upgrade.get_upgrade_data()




func eval(input):
	var node = Node.new()
	get_tree().add_child(node)
	var script = GDScript.new()
	
	script.set_source_code("extends Node\nfunc eval():\n\tvar array = get_tree().get_nodes_in_group('Player') \n\tvar player = array.pick_random() \n\t" + input)
	ResourceSaver.save(script, "res://testfile.gd");
	script.reload()
	node.set_script(script)
	node.eval()
	
	node.queue_free()



