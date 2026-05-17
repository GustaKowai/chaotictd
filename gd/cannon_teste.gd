extends Cannon_tower
@onready var upgrade_ui: upgrade_UI = $Upgrade_UI

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		upgrade_ui.show()
		# Use o seguinte para os upgrades:
		#print_debug(upgrade_ui.rota_1_1.button_pressed)
