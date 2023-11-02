class_name Selectable extends Node2D

var current_upgrade_value = 1
var tower_name = ""

var upgrade1_data  = {
	"1" = ["clciker", "10" ,"player.double_fire = true"],
	"2" = ["Extented Range", "100" ,"player/Attack_Range/CollisionShape2D.radius += 50"],
	"3" = ["Rapid Fire", "100000" ,"player.reload_timer = 0.1"],
	"4" = ["Max" , "10000000000000000000000000000000" , "\"print('max value')\""]
}

var upgrade2_data  = {
"1" = ["clicks ", "15" ,"player.penetrating_bullets = true"],
"2" = ["Infinite ammo", "300" ,"player.inf_ammo = true"],
"3" = [" Quad Fire ", "300000" ,"player.quad_fire = true"],
"4" = ["Max" , "10000000000000000000000000000000" , "\"print('max value')\""]
}

var upgrade3_data  = {
	"1" = ["fast", "13.5" ,"player.money_per_kill += 1"],
	"2" = ["homimg bullets", "500" ,"player.homing_bullet = true"],
	"3" = ["100 Extra Money Per Kill", "1000000" ,"player.money_per_kill += 100"],
	"4" = ["Max" , "10000000000000000000000000000000" , "\"print('max value')\""]
}

var upgrade_array = [upgrade1_data, upgrade2_data, upgrade3_data]


func remove_from_selected():
	remove_from_group("selected")

func current_upgrade_value_add():
	if current_upgrade_value <= 3:
		current_upgrade_value += 1


