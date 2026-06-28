extends Marker2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.posicao_base = global_position
	print_debug(GameManager.posicao_base)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
