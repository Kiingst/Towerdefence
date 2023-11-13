extends Node2D

var selected = false
var ammo = 0
var can_shoot = true
var enemys_in_range = false
var icon = "res://icon.svg"

#variables
var price = 10 
var disabled = false

signal fire

@onready var upgrades = get_tree().get_nodes_in_group("Base_Level")[0].get_node("Upgrades")
#Upgradagle Variables

@onready var max_ammo = upgrades.tower1_numbers[0]
@onready var reload_timer = upgrades.tower1_numbers[1]
@onready var tower_damage = upgrades.tower1_numbers[2]
@onready var ammo_increment = upgrades.tower1_numbers[3]
@onready var money_per_kill = upgrades.tower1_numbers[4]
@onready var attack_range = upgrades.tower1_numbers[5]
@export var projectile : PackedScene


#special upgrades
var double_fire = false
var homimg_bullet = false
var penetrating_bullets = false
var inf_ammo = false
var quad_fire = false

#Upgrade data syntax
# "Upgrade" = ["Upgrade_text", "Cost", "Code"]

var current_upgrade_value = 1
var tower_name = "Basic Tower"

var upgrade1_data  = {
	"1" = ["Double Shot", "10" ,"player.double_fire = true"],
	"2" = ["Extented Range", "100" ,"player/Attack_Range/CollisionShape2D.radius += 50"],
	"3" = ["Rapid Fire", "100000" ,"player.reload_timer = 0.1"],
	"4" = ["Max" , "10000000000000000000000000000000" , "\"print('max value')\""]
	
}
var upgrade2_data  = {
	"1" = ["Penetrating Bullets ", "15" ,"player.penetrating_bullets = true"],
	"2" = ["Infinite ammo", "300" ,"player.inf_ammo = true"],
	"3" = [" Quad Fire ", "300000" ,"player.quad_fire = true"],
	"4" = ["Max" , "10000000000000000000000000000000" , "\"print('max value')\""]
}
var upgrade3_data  = {
	"1" = ["1 Extra Money Per kill ", "13.5" ,"player.money_per_kill += 1"],
	"2" = ["homimg bullets", "500" ,"player.homing_bullet = true"],
	"3" = ["100 Extra Money Per Kill", "1000000" ,"player.money_per_kill += 100"],
	"4" = ["Max" , "10000000000000000000000000000000" , "\"print('max value')\""]
}

var upgrade_array = [upgrade1_data, upgrade2_data, upgrade3_data]
# Called when the node enters the scene tree for the first time.
func _ready():
	update()
	attack_range = $Attack_Range/CollisionShape2D.shape.radius
	add_to_group("Towers")
	add_to_group("Tower1")
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not disabled:
		#print($Attack_Range.get_overlapping_areas())
		if can_shoot == true && $Attack_Range.get_overlapping_areas().size() > 0 && ammo > 0 :
			attack_enemy()
		$Ammo_bar.value = ammo
		
		if Input.is_action_just_released("Right_Click"):
			selected = false
	
	if selected == true:
		$Attack_Range.visible = true
	else:
		$Attack_Range.visible = false
	
	

func attack_enemy():
	var x = $Attack_Range.get_overlapping_areas()
	var y = x[0]
	if y.get_parent().has_method('take_damage'):  
			$Reload_Timer.start()
			can_shoot = false
			shoot_at_enemy(y)
			#print("shooting at " ,y)
			#y.get_parent().take_damage(tower_damage) 
			ammo -= 1

func shoot_at_enemy(enemy):
	var vec_to_enemy = enemy.global_position - global_position
	vec_to_enemy = vec_to_enemy.normalized()
	$Barell.global_rotation = atan2(vec_to_enemy.y, vec_to_enemy.x)
	var direction = Vector2(1,0).rotated($Barell.global_rotation)
	#fire(projectile , $Barell/Marker2D.global_position, direction)
	emit_signal('fire', projectile , $Barell/Marker2D.global_position, direction, tower_damage)
	#print("shooting at " ,enemy)
	#ammo -= 1
	pass

func clicked():
	if max_ammo > ammo:
		ammo += ammo_increment
		#print("Tower at ", position, " now has ", ammo, " bullets")
	else:
		#print("Tower at ", position, " ammo at max ")
		pass

func _on_reload_timer_timeout():
	can_shoot = true
	


	

func _on_clickable_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		clicked()
	
	#on right click made current turret selected
	if Input.is_action_pressed("Right_Click"):
		if get_tree().get_nodes_in_group("Base_Level")[0].build_mode == false:
			selected = true
			get_tree().call_group("selected", "remove_from_selected")
			add_to_group("selected")
			
	

func update():
	$Ammo_bar.max_value = max_ammo
	$Ammo_bar.step = ammo_increment
	$Reload_Timer.wait_time = reload_timer
	

func remove_from_selected():
	remove_from_group("selected")
	
func current_upgrade_value_add():
	if current_upgrade_value <= 3:
		current_upgrade_value += 1
		


