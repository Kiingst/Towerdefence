extends MarginContainer
signal button_press
var upgrade
var x = 1
var process = false



# Called when the node enters the scene tree for the first time.

func _ready():
	#display_upgrade(upgrade)
	pass


# Called every frame. 'delta' is the elapsed time since the previous f	rame.
func _process(delta):
	#text = text
	#$ColorRect/VBoxContainer/Button.text = text
	if process:
		$ColorRect/VBoxContainer/Button.text = "Buy " + str(upgrade.get_price()) + "$"
		$ColorRect/VBoxContainer/Text_Upgrades/Current.text = upgrade.names + " " + str(upgrade.get_upgrade_data())
		$ColorRect/VBoxContainer/Text_Upgrades/Next.text = str(upgrade.get_upgrade_data(1))
	
	

func _on_button_pressed():
	#emit_signal("button_press", upgrade_type, price, upgrade_table)
	upgrade.buy_upgrade()

func display_upgrade(upgrade1):
	upgrade = upgrade1
	$ColorRect/VBoxContainer/Button.text = "Buy " + str(upgrade.get_price()) + "$"
	$ColorRect/VBoxContainer/Text_Upgrades/Current.text = upgrade.names + " " + str(upgrade.get_upgrade_data())
	$ColorRect/VBoxContainer/Text_Upgrades/Next.text = str(upgrade.get_upgrade_data(1))
	process = true
