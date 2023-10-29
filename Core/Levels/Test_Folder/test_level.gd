extends Node2D
@export var enemy : PackedScene
signal spawn_enemy
signal life_loss


#waves
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	emit_signal("spawn_enemy", enemy)


func _on_end_area_entered(area):
	if area.get_parent().is_in_group("Enemys"):
		print("enemy entered final area")
		emit_signal("life_loss", area.get_parent().health)
		area.get_parent().queue_free()
