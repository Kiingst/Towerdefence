extends Node2D


var ammo = 0
var can_shoot = true
var enemys_in_range = false

signal fire

#Upgradagle Variables
var max_ammo = 10
var reload_timer = 1
var tower_damage = 1
var ammo_increment = 1
var attack_range
@export var projectile : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	update()
	
	add_to_group("Towers")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print($Attack_Range.get_overlapping_areas())
	if can_shoot == true && $Attack_Range.get_overlapping_areas().size() > 0 && ammo > 0 :
		attack_enemy()
	$Ammo_bar.value = ammo

func attack_enemy():
	var x = $Attack_Range.get_overlapping_areas()
	var y = x[0]
	if y.get_parent().has_method('take_damage'):  
			$Reload_Timer.start()
			can_shoot = false
			#shoot_at_enemy(y)
			print("shooting at " ,y)
			y.get_parent().take_damage(tower_damage) 
			ammo -= 1

func shoot_at_enemy(enemy):
	#var vec_to_enemy = enemy.global_position - global_position
	#vec_to_enemy = vec_to_enemy.normalized()
	#$test_sword.global_rotation = atan2(vec_to_enemy.y, vec_to_enemy.x)
	#var direction = Vector2(1,0).rotated($test_sword.global_rotation)
	#emit_signal('fire', projectile , $test_sword/fire.global_position, direction)
	#print("shooting at " ,enemy)
	#ammo -= 1
	pass

func click():
	if max_ammo > ammo:
		ammo += ammo_increment
		print("Tower at ", position, " now has ", ammo, " bullets")
	else:
		print("Tower at ", position, " ammo at max ")

func _on_reload_timer_timeout():
	can_shoot = true
	



func _on_clickable_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		click()
		

func update():
	$Ammo_bar.max_value = max_ammo
	$Ammo_bar.step = ammo_increment
	$Reload_Timer.wait_time = reload_timer
	
