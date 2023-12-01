extends Area2D


@export var Bullet_Speed : int = 400
@export var Bullet_Damage: float 
@export var Bullet_lifetime : float = 3

func _ready():
	$life_time.wait_time = Bullet_lifetime

var Bullet_velocity = Vector2()

func start(_position, _direction):
	#print("bullet starting")
	position = _position
	rotation = _direction.angle()
	Bullet_velocity = _direction * Bullet_Speed

func _process(delta):
	position += Bullet_velocity * delta


func _on_area_entered(area):
	if area.get_parent().has_method('take_damage'):
		area.get_parent().take_damage(Bullet_Damage)
		#print("did ", Bullet_Damage, " Damage")
		queue_free()


func _on_life_time_timeout():
	queue_free()
