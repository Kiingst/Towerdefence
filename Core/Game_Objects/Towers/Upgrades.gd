extends Node
# array syntax max_amo reload_timer, tower_damage, ammo_increment, money_per_kill, attack_range
var tower1_numbers = [10 , 1.0, 1.0, 1.0, 1, 250]
@export var projectile : PackedScene
var tower2 = []
var tower3 = []

#upgrade format name base_price multiplier upgrade_data(base num , multiplier)
var ammo_upgrade = Classes.upgrade.new("Max ammo", 10, 1.05, [1, 1])

var reload_time_upgrade = Classes.upgrade.new("Reload Time", 12, 1.15, [1, 1])
var damage_upgrade = Classes.upgrade.new("Damage +", 20, 1.07, [1, 1])
var ammo_per_click_upgrade = Classes.upgrade.new("Ammo Per Click", 50, 1.12, [1, 1])
var money_upgrade = Classes.upgrade.new("Money Per Kill", 10, 1.03, [1, 1])
var attack_range_upgrade = Classes.upgrade.new("Attack Range", 40, 1.25, [250, 1])


var tower1 = Classes.tower.new(10, 2, 1, preload("res://Core/Game_Objects/Basic_Tower/basic_tower.tscn"),[ammo_upgrade, reload_time_upgrade,damage_upgrade, ammo_per_click_upgrade,money_upgrade,attack_range_upgrade])


# Called when the node enters the scene tree for the first time.
func _ready():
	print(tower1.get_upgrades())
	#print("test")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

