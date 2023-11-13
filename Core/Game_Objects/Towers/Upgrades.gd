extends Node
# array syntax max_amo reload_timer, tower_damage, ammo_increment, money_per_kill, attack_range
var tower1_numbers = [10 , 1.0, 1.0, 1.0, 1, 250]
@export var projectile : PackedScene
var tower2 = []
var tower3 = []

var tower1_current_upgrade = {
	"0" = 0,
	"1" = 0,
	"2" = 0,
	"3" = 0,
	"4" = 0,
	"5" = 0
	
}

var tower1 = {
	#syntax name, current_price, curent_price + 1
	"0" = ["Max ammo", 10 * pow(1.15, tower1_current_upgrade.get("0")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ],
	"1" = ["Reload Time", 10 * pow(1.15, tower1_current_upgrade.get("0")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ],
	"2" = ["Damage", 10 * pow(1.15, tower1_current_upgrade.get("0")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ],
	"3" = ["Ammo Per Click", 10 * pow(1.15, tower1_current_upgrade.get("0")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ],
	"4" = ["Money per Kill", 10 * pow(1.15, tower1_current_upgrade.get("0")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ],
	"5" = ["Attack Range", 10 * pow(1.15, tower1_current_upgrade.get("0")), 10 * pow(1.15, tower1_current_upgrade.get("0") + 1) ]
	
}
 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



