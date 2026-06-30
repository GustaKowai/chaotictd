extends Building
class_name Base
var killer_cd:int = 0
@export var dinheiro_por_rodada:int = 10
@export var turn_heal:float = 0.02
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var area_dano_up: Area2D = $area_dano_up
@onready var timer: Timer = $area_dano_up/Timer
@onready var cannon_base: Node2D = $cannon_base
@export var bullet:PackedScene
@export var number_rotations:int

func _ready() -> void:
	super()
	WaveManager.start_wave.connect(give_pieces)
	upgrade_ui.vender.visible = false
	WaveManager.start_wave.connect(func(_int): killer_cd -= 1)
	WaveManager.start_wave.emit(0)

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
	
func upgrade_2_2():
	dinheiro_por_rodada = 40
	
func upgrade_2_3():
	GameManager.damage_multiplier = 1.2
	
func upgrade_3_1():
	timer.timeout.connect(area_dano_up.deal_damage)
	timer.start()
	
func upgrade_3_2():
	timer.timeout.connect(round_and_shoot)

func upgrade_3_3():
	dying.connect(kill_everybody)

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
		
func kill_everybody():
	if killer_cd > 0:
		return
	killer_cd = 5
	var enemies = get_tree().get_nodes_in_group("Enemy")
	for enemy in enemies:
		enemy.get_parent().die()
		
func shoot():
	var cannons = cannon_base.get_children()
	for cannon in cannons:
		var b:Bullet = bullet.instantiate()
		get_tree().root.get_node("Main").add_child(b)
		b.transform = cannon.global_transform
		b.scale = Vector2(1.0,1.0)

func round_and_shoot():
	for i in number_rotations:
		shoot()
		cannon_base.rotate(2*PI/number_rotations)
