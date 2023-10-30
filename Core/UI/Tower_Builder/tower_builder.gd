extends GridContainer
#var base_level = get_tree().get_nodes_in_group("Base_Level")[0]
signal tower_builder_button_pressed

@export var tower1 : PackedScene
#@export var Button2 : PackedScene
#@export var Button3 : PackedScene
#@export var Button4 : PackedScene
#@export var Button5 : PackedScene
#@export var Button6 : PackedScene
#@export var Button7 : PackedScene
#@export var Button8 : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_1_pressed():
	var t = tower1.instantiate()
	emit_signal("tower_builder_button_pressed", t.price, tower1)
	t.queue_free()


func _on_button_2_pressed():
	emit_signal("tower_builder_button_pressed", "2")


func _on_button_3_pressed():
	emit_signal("tower_builder_button_pressed", "3")


func _on_button_4_pressed():
	emit_signal("tower_builder_button_pressed", "4")


func _on_button_5_pressed():
	emit_signal("tower_builder_button_pressed", "5")


func _on_button_6_pressed():
	emit_signal("tower_builder_button_pressed", "6")


func _on_button_7_pressed():
	emit_signal("tower_builder_button_pressed", "7")


func _on_button_8_pressed():
	emit_signal("tower_builder_button_pressed", "8")
