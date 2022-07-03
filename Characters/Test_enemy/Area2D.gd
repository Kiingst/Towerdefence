extends Area2D

onready var path_follow = get_parent()

export (int) var speed 
export (int) var health
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health == 0:
		death(delta)
	path_follow.set_offset(path_follow.get_offset() + speed * delta)

func take_damage(damage):
	health -= damage
	print(health)

func death(delta):
	path_follow.offset = 0.0
	queue_free()
