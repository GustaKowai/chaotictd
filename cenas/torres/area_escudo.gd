extends Area2D
@export var shield_value:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	WaveManager.start_wave.connect(criar_escudo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func criar_escudo(wave):
	print_debug("tentou criar escudo")
	var torres = get_overlapping_bodies()
	#print_debug(inimigos)
	for torre in torres:
		if torre.is_in_group("torre"):
			torre.set_shield(shield_value)
