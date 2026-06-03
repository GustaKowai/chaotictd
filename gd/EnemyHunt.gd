extends EnemyFollow
class_name  EnemyHunt
var chasing:bool = false

@export var area_alerta:Area2D
@export var speed_hunting:float
var speed_not_hunting:float = move_speed

func Enter():
	super()
	#print_debug(speed_hunting,move_speed)
	enemy.alvo = base
	#speed_not_hunting = move_speed
	chasing = false
	#print_debug(alvo)

func Physics_update(_delta: float):
	chase()
	super(_delta)
	#print(enemy.alvo)
		
func chase():
	if chasing:
		return
	var alvos = area_alerta.get_overlapping_bodies()
	
	if alvos.size() < 1:
		chasing = false
		move_speed = speed_not_hunting
		
	for alvo in alvos:
		if alvo.is_in_group("torre"):
			enemy.alvo = alvo
			print_debug(enemy.alvo)
			move_speed = speed_hunting
			if enemy.sprite.has_method("play"):
				enemy.sprite.play("hunt")
			chasing = true
			
func lost_target():
	move_speed = speed_not_hunting
	if enemy.sprite.has_method("play"):
		enemy.sprite.play("follow")
	#print_debug("Perdi o alvo")
	if base:
		chasing = false
		enemy.alvo = base
	else:
		super()
