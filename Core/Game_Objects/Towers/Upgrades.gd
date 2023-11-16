extends Node
# array syntax max_amo reload_timer, tower_damage, ammo_increment, money_per_kill, attack_range
var tower1_numbers = [10 , 1.0, 1.0, 1.0, 1, 250]
@export var projectile : PackedScene
var tower2 = []
var tower3 = []

#upgrade format name base_price multiplier
var ammo_upgrade = Classes.upgrade.new("Max ammo", 10, 1.05)
var reload_time_upgrade = Classes.upgrade.new("Reload Time", 12, 1.15)
var damage_upgrade = Classes.upgrade.new("Damage +", 20, 1.07)
var ammo_per_click_upgrade = Classes.upgrade.new("Ammo Per Click", 50, 1.12)
var money_upgrade = Classes.upgrade.new("Money Per Kill", 10, 1.03)
var attack_range_upgrade = Classes.upgrade.new("Attack Range", 40, 1.25)


var tower1 = Classes.tower.new( 1, [ammo_upgrade, reload_time_upgrade,damage_upgrade, ammo_per_click_upgrade,money_upgrade,attack_range_upgrade])

#var tower1_current_upgrade = {
#	"0" = 1,
#	"1" = 1,
#	"2" = 1,
#	"4" = 1,
#	"5" = 1
	
#}

#var tower1_data = {
#	#syntax name, current_price, curent_price + 1
#	"0" = ["Max ammo", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("0")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ],
#	"1" = ["Reload Time", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("1")), 10 * pow(1.15, tower1_current_upgrade.get("1") + 1) ],
#	"2" = ["Damage",get_upgrade_price(10, 1.15, tower1_current_upgrade.get("2")), 10 * pow(1.15, tower1_current_upgrade.get("2") + 1) ],
#	"3" = ["Ammo Per Click", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("3")), 10 * pow(1.15, tower1_current_upgrade.get("3") + 1) ],
#	"4" = ["Money per Kill", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("4")), 10 * pow(1.15, tower1_current_upgrade.get("4") + 1) ],
#	"5" = ["Attack Range", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("5")), 10 * pow(1.15, tower1_current_upgrade.get("5") + 1) ]
	
#
 



# Called when the node enters the scene tree for the first time.
func _ready():
	print(tower1.get_upgrades())
	#print("test")
	#pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#tower1_data = {
	#	"0" = ["Max ammo", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("0")), get_upgrade_price(10, 1.15, tower1_current_upgrade.get("0") + 1) ],
	#	"1" = ["Reload Time", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("1")), get_upgrade_price(10, 1.15, tower1_current_upgrade.get("1") + 1) ],
	#	"2" = ["Damage", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("2")), get_upgrade_price(10, 1.15, tower1_current_upgrade.get("2") + 1) ],
	#	"3" = ["Ammo Per Click", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("3")), get_upgrade_price(10, 1.15, tower1_current_upgrade.get("3") + 1) ],
	#	"4" = ["Money per Kill", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("4")), get_upgrade_price(10, 1.15, tower1_current_upgrade.get("4") + 1) ],
	#	"5" = ["Attack Range", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("5")), get_upgrade_price(10, 1.15, tower1_current_upgrade.get("5") + 1) ]
		
	#}


func get_upgrade_price(baseprice, multiplyer, current_num_bought):
	return snapped(baseprice * pow(multiplyer, current_num_bought), 0.01)

