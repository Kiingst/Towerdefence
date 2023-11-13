extends Node
# array syntax max_amo reload_timer, tower_damage, ammo_increment, money_per_kill, attack_range
var tower1_numbers = [10 , 1.0, 1.0, 1.0, 1, 250]
@export var projectile : PackedScene
var tower2 = []
var tower3 = []

var tower1_current_upgrade = {
	"0" = 1,
	"1" = 1,
	"2" = 1,
	"3" = 1,
	"4" = 1,
	"5" = 1
	
}

var tower1 = {
	#syntax name, current_price, curent_price + 1
	"0" = ["Max ammo", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("0")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ],
	"1" = ["Reload Time", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("1")), 10 * pow(1.15, tower1_current_upgrade.get("1") + 1) ],
	"2" = ["Damage",get_upgrade_price(10, 1.15, tower1_current_upgrade.get("2")), 10 * pow(1.15, tower1_current_upgrade.get("2") + 1) ],
	"3" = ["Ammo Per Click", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("3")), 10 * pow(1.15, tower1_current_upgrade.get("3") + 1) ],
	"4" = ["Money per Kill", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("4")), 10 * pow(1.15, tower1_current_upgrade.get("4") + 1) ],
	"5" = ["Attack Range", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("5")), 10 * pow(1.15, tower1_current_upgrade.get("5") + 1) ]
	
}
 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tower1 = {
		"0" = ["Max ammo", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("0")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ],
		"1" = ["Reload Time", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("1")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ],
		"2" = ["Damage", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("2")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ],
		"3" = ["Ammo Per Click", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("3")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ],
		"4" = ["Money per Kill", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("4")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ],
		"5" = ["Attack Range", get_upgrade_price(10, 1.15, tower1_current_upgrade.get("5")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ]
		
	}


func get_upgrade_price(baseprice, multiplyer, current_num_bought):
	return snapped(baseprice * pow(multiplyer, current_num_bought), 0.01)
