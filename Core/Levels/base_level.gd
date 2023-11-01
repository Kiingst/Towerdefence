extends Node2D
var money = 10000000
var click_damage = 1
var health = 100
var Currently_accepted
var build_mode = false

var build_mode_turret 

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Base_Level")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var format_string_money = "Gold %s"
	$UI/Hud/VBoxContainer/Top_Bar/Money_Count.set_text(format_string_money % money) 
	var format_string_health = "Health %s"  
	$UI/Hud/VBoxContainer/Top_Bar/Health_Count.set_text(format_string_health % health)
	
	if build_mode:
		var placed = false
		build_mode_turret.global_position = lerp(build_mode_turret.global_position, get_global_mouse_position(), 50 * delta)
		
		if Input.is_action_pressed("Left_Click"):
			var good_placement = false
			var snap = snapped(get_global_mouse_position(), Vector2(32,32))
			
			var x = fmod((snap.x / 32), 2) == 1
			var y = fmod((snap.x / 32), 2) == 1
			if x and y:
				good_placement = true
			
			if good_placement == true:
				money -= build_mode_turret.price
				build_mode_turret.global_position = snapped(get_global_mouse_position(), Vector2(32,32))
				build_mode_turret.disabled = false
				placed = true
				build_mode = false
			else:
				build_mode_turret.queue_free()
				build_mode = false
				print("didnt place")
	
	


func death(value):
	money += value


func _on_test_level_spawn_enemy(enemy):
	var e = enemy.instantiate()
	$Test_Level/Path2D.add_child(e)
	
	var enemys = get_tree().get_nodes_in_group("Enemys")
	for i in enemys.size():
		enemys[i].connect("death",Callable(self,"death"))


func _on_basic_tower_fire(projectile, _position, _direction, tower_damage):
	var p = projectile.instantiate()
	add_child(p)
	p.Bullet_Damage = tower_damage
	p.start(_position, _direction)


func _on_test_level_life_loss(loss):
	health -= loss


func _on_tower_builder_tower_builder_button_pressed(price, tower):
	print(price)
	if price <= money:
		start_build_mode(tower)
	else:
		print("You donthave enough money")
	


func start_build_mode(packed_scene):
	build_mode_turret = packed_scene.instantiate()
	build_mode_turret.disabled = true
	build_mode = true
	add_child(build_mode_turret)
	build_mode_turret.connect("fire",Callable(self,"_on_basic_tower_fire"))
	


func _on_upgrade_node_button_pressed(node, upgrade):
	#check if enough moeny for upgrade
	var upgrade_array = node.upgrade_array
	var upgrade_dict = upgrade_array[upgrade - 1]
	var inner_upgrade_array = upgrade_dict.get(str(node.current_upgrade_value))
	var price = int(inner_upgrade_array[1])
	
	print("price is ", price)
	if price <= money:
		money -= price
		node.current_upgrade_value_add()
		#print("bought item")
		apply_upgrade(node, inner_upgrade_array[2])

func apply_upgrade(node, upgrade):
	print("applying ", upgrade, " on ", node)
