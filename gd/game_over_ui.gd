class_name GameOverUI
extends CanvasLayer

@onready var waves_number: Label = %wavesNumber

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_over.connect(show)
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	hide()
	GameManager.restart()


func _on_visibility_changed() -> void:
	waves_number.text = str(WaveManager.wave)
