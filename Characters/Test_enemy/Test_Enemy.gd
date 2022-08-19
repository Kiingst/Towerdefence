extends PathFollow2D

onready var path_follow = self

export (int) var speed 
export (int) var health
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$enemy/HealthBar.max_value = health
	$enemy/HealthBar.value = health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$enemy/HealthBar.value = health
	if health == 0:
		death()
	path_follow.set_offset(path_follow.get_offset() + speed * delta)

func take_damage(damage):
	health -= damage
	$enemy/HealthBar.visible = true
	print(health)

func death():
	queue_free()
