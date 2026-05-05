extends Node2D
@onready var enemy_position: PathFollow2D = $Path2D/enemy_position

@export var enemys:Array[enemy_spawn_char]
@export var wave_duration:float
var current_wave:int
var wave_value:int
var enemies_to_spawn:Array[PackedScene]
var spawn_interval:float
var spawn_timer:float
var wave_timer:float	

func _ready() -> void:
	WaveManager.start_wave.connect(spawn_wave)
	spawn_wave(WaveManager.wave)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spawn_timer <= 0:
		spawn()
	else:
		spawn_timer-=delta
		wave_timer-=delta

func spawn_wave(wave:int):
	print_debug("chegou no spawn")
	generate_wave(wave)

func spawn():
	if enemies_to_spawn.size()> 0:
		var enemy_spawning = enemies_to_spawn[0].instantiate()
		enemy_position.progress_ratio = randf()
		enemy_spawning.global_position = enemy_position.global_position
		get_parent().add_child(enemy_spawning)
		enemies_to_spawn.remove_at(0)
		spawn_timer = spawn_interval
	else:
		wave_timer = 0
		
func generate_wave(wave):
	print_debug("chegou no generate wave")
	wave_value = WaveManager.wave*5
	generate_enemies(wave)
	
	spawn_interval = wave_duration/enemies_to_spawn.size()
	wave_timer = wave_duration
	
func generate_enemies(wave):
	print_debug("chegou no generate enemies")
	var generated_wave:Array[PackedScene]
	while wave_value > 0:
		var rand_enemy_id:int = randi_range(0,enemys.size()-1)
		print_debug(rand_enemy_id)
		var enemy_cost = enemys[rand_enemy_id].cost
		var enemy_wave_start = enemys[rand_enemy_id].initial_wave
		if wave_value-enemy_cost >= 0 and WaveManager.wave >= enemy_wave_start:
			generated_wave.append(enemys[rand_enemy_id].enemy)
			wave_value -= enemy_cost
	enemies_to_spawn.clear()
	enemies_to_spawn = generated_wave
