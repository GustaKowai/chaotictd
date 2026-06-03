extends Building
class_name Base

func _ready() -> void:
	super()
	upgrade_ui.vender.visible = false

func _on_rota_1_1_pressed() -> void:
	pass # Replace with function body.

func die():
	GameManager.game_over.emit()
	super()
	
func game_over():
	pass
