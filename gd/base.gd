extends Building
class_name Base
@export var dinheiro_por_rodada:int = 10
@export var turn_heal:float = 0.02
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D

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
	@warning_ignore("narrowing_conversion")
	max_health *= 1.1
	heal_damage(max_health-vida_antes)
	
func upgrade_1_2():
	WaveManager.start_wave.connect(heal_at_start)
	
func upgrade_1_3():
	WaveManager.start_wave.connect(shield_at_start)
	
func upgrade_2_1():
	dinheiro_por_rodada = 20

func heal_at_start(_wave):
	@warning_ignore("narrowing_conversion")
	heal_damage(max_health*turn_heal)
	gpu_particles_2d.emitting = true

func shield_at_start(_wave):
	print_debug("shield")
	@warning_ignore("integer_division")
	var bonus_shield:int = current_health/20
	if shield + bonus_shield > max_health*0.2:
		@warning_ignore("narrowing_conversion")
		shield = max_health*0.2
	else:
		shield += bonus_shield
		print_debug(shield)
