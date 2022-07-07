extends Area2D

onready var path_follow = get_parent()

export (int) var speed 
export (int) var health
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$HealthBar.max_value = health
	$HealthBar.value = health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HealthBar.value = health
	if health <= 0:
		death()
	path_follow.set_offset(path_follow.get_offset() + speed * delta)
	path_follow.offset +  5

func take_damage(damage):
	health -= damage
	$HealthBar.visible = true
	print(health)

func death():
	queue_free()
