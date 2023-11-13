extends Node
# array syntax max_amo reload_timer, tower_damage, ammo_increment, money_per_kill, attack_range
var tower1_numbers = [10 , 1.0, 1.0, 1.0, 1, 250]
@export var projectile : PackedScene
var tower2 = []
var tower3 = []

var tower1 = {
	#syntax name, price, numbers
	"0" = ["Max ammo", "price", 10],
	"1" = ["Reload Time", "price", 10],
	"2" = ["Damage", "price", 10],
	"3" = ["Ammo Per Click", "price", 10],
	"4" = ["Money per Kill", "price", 10],
	"5" = ["Attack Range", "price", 10]
	
}
 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



