extends PathFollow2D

var move_speed = 0.02
var health = 3
var value = 0.5
signal death
var current_tower_attacked

# Called when the node enters the scene tree for the first time.
func _ready():
	$HealthBar.max_value = health
	$HealthBar.value = health
	add_to_group("Enemys")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HealthBar.value = health
	if health <= 0:
		emit_signal("death", current_tower_attacked.money_per_kill + value)
		queue_free()
	
	progress_ratio += (delta * move_speed)
	#path_follow.set_offset(path_follow.get_offset() + speed * delta)
	#path_follow.offset +  5

func take_damage(damage, tower = null):
	if tower != null:
		current_tower_attacked = tower
	health -= damage
	$HealthBar.visible = true


func clicked():
	take_damage(get_tree().get_nodes_in_group("Base_Level")[0].click_damage)


func _on_clickable_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		clicked()


