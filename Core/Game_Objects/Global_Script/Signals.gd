extends Node

signal UpgradeBought


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

class Upgrade:
	#member variables
	var another : int
	
	func _init(another1):
		another = another1
	
	func getAnother():
		return another
