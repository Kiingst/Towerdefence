extends Node2D
@export var enemy : PackedScene
signal spawn_enemy


#waves
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	emit_signal("spawn_enemy", enemy)
