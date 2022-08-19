extends Area2D

export (int) var Tower_Damage
var can_shoot = false
onready var attack_range = $Base_tower
signal fire
var sword
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	sword = preload("res://Characters/projectiles/sword_projectiles.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_shoot == true && $Attack_Range.get_overlapping_areas().size() > 0 :
		attack_enemy()


func _on_Reload_timeout():
	can_shoot = true
	

func attack_enemy():
	var x = $Attack_Range.get_overlapping_areas()
	var y = x[0]
	if y.has_method('take_damage'):  
			$Reload.start()
			can_shoot = false
			shoot_at_enemy(y)


func _on_Attack_Range_area_entered(area):
	if "enemy" in area.name:
		can_shoot =  true

func shoot_at_enemy(enemy):
	var vec_to_enemy = enemy.global_position - global_position
	vec_to_enemy = vec_to_enemy.normalized()
	$test_sword.global_rotation = atan2(vec_to_enemy.y, vec_to_enemy.x)
	var direction = Vector2(1,0).rotated($test_sword.global_rotation)
	emit_signal('fire', sword , $test_sword/fire.global_position, direction)

