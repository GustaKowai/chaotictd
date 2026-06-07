extends Building
class_name Base
@export var dinheiro_por_rodada:int = 20
@export var turn_heal:float = 0.02

func _ready() -> void:
	super()
	WaveManager.start_wave.connect(give_pieces)
	upgrade_ui.vender.visible = false
	

func die():
	GameManager.game_over.emit()
	super()
	
func game_over():
	pass

func give_pieces(wave):
	GameManager.piece_count += wave*dinheiro_por_rodada
	GameManager.piece_collected.emit()

func upgrade_1_1():
	var vida_antes = max_health
	max_health *= 1.1
	heal_damage(max_health-vida_antes)
	
func upgrade_1_2():
	WaveManager.start_wave.connect(heal_at_start)
	
func upgrade_2_1():
	dinheiro_por_rodada = 50

func heal_at_start(_wave):
	heal_damage(max_health*turn_heal)
