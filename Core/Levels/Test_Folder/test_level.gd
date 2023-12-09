extends Node2D
@export var enemy : PackedScene

signal spawn_enemy
signal life_loss
var rng = RandomNumberGenerator.new()


var health_multiplier = 1
var speed_multiplier = 1

#waves
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	var x = rng.randi_range(0,80)
	if x <= 40:
		#spawn basic enemy
		emit_signal("spawn_enemy", enemy, 0.25, 3 * health_multiplier, 0.02 )
	elif x <= 60:
		emit_signal("spawn_enemy", enemy, 0.5,  10 * health_multiplier, 0.01 )
	elif x <= 70:
		emit_signal("spawn_enemy", enemy)
	elif x <= 80:
		emit_signal("spawn_enemy", enemy)
	
	emit_signal("spawn_enemy", enemy)


func _on_end_area_entered(area):
	if area.get_parent().is_in_group("Enemys"):
		print("enemy entered final area")
		emit_signal("life_loss", area.get_parent().health)
		area.get_parent().queue_free()
