extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_over.connect(queue_free)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	GameManager.piece_count += 1
	GameManager.piece_collected.emit()
	queue_free()
