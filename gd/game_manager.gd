extends Node
var base:PackedScene = preload("uid://t4n6p64qxp5d")
var piece_count:int
@warning_ignore("unused_signal")
signal UI_tower_mouse
@warning_ignore("unused_signal")
signal piece_collected()
@warning_ignore("unused_signal")
signal game_over()
@warning_ignore("unused_signal")
signal tutorial_on()
signal restart_game()
var pieces_started:int = 150
var posicionando:bool
var is_game_over:bool = false
var posicao_base:Vector2
var pontuacao_waves:Array = [["name",1],["name2",0]]
var damage_multiplier:float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree().get_first_node_in_group("base_position"):
		posicao_base = get_tree().get_first_node_in_group("base_position").global_position
	else:
		posicao_base = Vector2(0,0)
	posicionando = false
	piece_count = pieces_started
	damage_multiplier = 1.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func restart():
	restart_game.emit()
	posicionando = false
	piece_count = pieces_started
	damage_multiplier = 1.0
	GameManager.piece_collected.emit()
	WaveManager.wave = 0
	WaveManager.start_wave.emit(WaveManager.wave)
	is_game_over = false
	var b = base.instantiate()
	b.global_position = posicao_base #Vector2(973,520)
	print_debug(posicao_base)
	get_tree().root.add_child(b)
