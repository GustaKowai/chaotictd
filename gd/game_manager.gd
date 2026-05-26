extends Node
var base:PackedScene = preload("uid://t4n6p64qxp5d")
var piece_count:int
signal piece_collected()
signal game_over()
signal restart_game()
var pieces_started:int = 15
var posicionando:bool
var is_game_over:bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	posicionando = false
	piece_count = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func restart():
	restart_game.emit()
	posicionando = false
	piece_count = pieces_started
	GameManager.piece_collected.emit()
	WaveManager.wave = 0
	WaveManager.start_wave.emit(WaveManager.wave)
	is_game_over = false
	var b = base.instantiate()
	b.global_position = Vector2(973,520)
	get_tree().root.add_child(b)
	
