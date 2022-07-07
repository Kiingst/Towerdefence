extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Base_tower2.connect("fire", self, "_on_Base_tower_fire")
	$Circ_Turret.connect("fire", self, "_on_Base_tower_fire")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Base_tower_fire(projectile, _position, _direction):
	var p = projectile.instance()
	add_child(p)
	p.start(_position, _direction)
	
