extends "res://Core/Game_Objects/Enemys/Basic_Enemy/enemy.gd"

@export var disabletime = 1.5
var rng = RandomNumberGenerator.new()
var moving = true
var tower_to_disable
var currently_disabling = false
var disabled = false


@onready var Animation_tree = $AnimationTree
@onready var Animation_mode = Animation_tree.get("parameters/playback")



var x 

# Called when the node enters the scene tree for the first time.
func _ready():
	get_values()
	$Clickable_Area.input_event.connect(_on_clickable_area_input_event)
	$Disable_time.wait_time = disabletime
	
	#var x = get_collsion_size(size)
	#$Sprite2D.scale = Vector2(size, size)
	#$Clickable_Area/CollisionShape2D.shape.size = Vector2(x, x)
	
	$HealthBar.max_value = health
	$HealthBar.value = health
	add_to_group("Enemys")
	Animation_mode.travel("moving")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HealthBar.value = health
	if health <= 0:
		if current_tower_attacked != null:
			emit_signal("death", current_tower_attacked.money_per_kill + value)
		else:
			emit_signal("death", value)
		
		Animation_mode.travel("death")

	
	if not currently_disabling:
		var x = $Disable_Area.get_overlapping_areas()
		if x.size() > 0:
			for i in x.size():
				if ("Tower" in x[i].get_parent().name) and x[i].get_parent().disabled == false:
					$Time_to_disable.start() 
					tower_to_disable = x[i].get_parent()
					moving = false
					currently_disabling = true
			
			
		
	
	if moving == true:
		progress_ratio += (delta * move_speed)


func disable_tower():
	$Sprite2D.visible = false
	$Disable_Area.monitorable = false
	$Clickable_Area.monitorable = false
	tower_to_disable.disabled = true
	$Disable_time.start()
	$HealthBar.visible = false


func get_values():
	self.move_speed = rng.randf_range(0.02, 0.04)
	self.health = rng.randi_range(2, 5)
	self.size = rng.randi_range(0.25, 0.35)


func _on_time_to_disable_timeout():
	disable_tower()


func _on_disable_time_timeout():
	tower_to_disable.disabled = false
	Animation_mode.travel("disabling")



