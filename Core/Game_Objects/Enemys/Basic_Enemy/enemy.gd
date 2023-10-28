extends PathFollow2D

var move_speed = 0.05
var health = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	$HealthBar.max_value = health
	$HealthBar.value = health
	add_to_group("Enemys")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HealthBar.value = health
	if health <= 0:
		queue_free()
	
	progress_ratio += (delta * move_speed)
	#path_follow.set_offset(path_follow.get_offset() + speed * delta)
	
	#path_follow.offset +  5

func take_damage(damage):
	health -= damage
	$HealthBar.visible = true
