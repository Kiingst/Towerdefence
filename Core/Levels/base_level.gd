extends Node2D
var money = 0
var click_damage = 1
var health = 100
var Currently_accepted
var build_mode = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Base_Level")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var format_string_money = "Gold %s"
	$UI/Hud/VBoxContainer/Top_Bar/Money_Count.set_text(format_string_money % money) 
	var format_string_health = "Health %s"  
	$UI/Hud/VBoxContainer/Top_Bar/Health_Count.set_text(format_string_health % health)


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

