extends Node2D
var money = 0
var click_damage = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Base_Level")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var format_string = "Gold %s"
	$UI/Hud/VBoxContainer/Top_Bar/Money_Count.set_text(format_string % money)  
	
	
	


func death(value):
	money += value


func _on_test_level_spawn_enemy(enemy):
	var e = enemy.instantiate()
	$Test_Level/Path2D.add_child(e)
	
	var enemys = get_tree().get_nodes_in_group("Enemys")
	for i in enemys.size():
		enemys[i].connect("death",Callable(self,"death"))
