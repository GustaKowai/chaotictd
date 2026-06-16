extends Enemy
@export var area_dano: Area2D
@export var dano:int

func die():
	if death_prefab:
		var death_object = death_prefab.instantiate()
		death_object.position = position
		death_object.dano = dano
		get_parent().add_child(death_object)
	await drop_pieces()
	WaveManager.enemy_dead.emit(1)
	queue_free()
