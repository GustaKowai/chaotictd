extends EnemyFollow
class_name  EnemyHunt
var chasing:bool = false

@export var area_alerta:Area2D

func Enter():
	super()
	#print_debug("Hunt")
	enemy.alvo = base
	chasing = false
	#print_debug(alvo)

func Physics_update(_delta: float):
	chase()
	super(_delta)
		
func chase():
	if chasing:
		return
	var alvos = area_alerta.get_overlapping_bodies()
	for alvo in alvos:
		if alvo.is_in_group("torre"):
			enemy.alvo = alvo
			chasing = true
			
func lost_target():
	#print_debug("Perdi o alvo")
	if base:
		chasing = false
		enemy.alvo = base
	else:
		Transitioned.emit(self,"idle")
