extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_over.connect(game_over)
	GameManager.restart_game.connect(restart)


func game_over():
	hide()
	
func restart():
	show()
