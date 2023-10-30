extends Node2D
var money = 100
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
			build_mode_turret.global_position = get_global_mouse_position()
			placed = true
			build_mode = false
	


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
		money -= price
		start_build_mode(tower)
	else:
		print("You donthave enough money")
	


func start_build_mode(packed_scene):
	build_mode_turret = packed_scene.instantiate()
	build_mode_turret.disabled = false
	build_mode = true
	add_child(build_mode_turret)
	build_mode_turret.connect("fire",Callable(self,"_on_basic_tower_fire"))
	
