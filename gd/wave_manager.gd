extends Node
signal start_wave(int)
signal wave_end
signal enemy_dead()
var wave:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemy_dead.connect(check_wave_end)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_wave_end():
	var enemies = get_tree().get_nodes_in_group("Enemy")
	if enemies.size() <= 1:
		print("fim da wave")
		wave_end.emit()
	#print(enemies.size())
	#for enemy in enemies:
		#print(enemy.get_parent())
