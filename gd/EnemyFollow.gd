extends State
class_name  EnemyFollow

@export var enemy: Enemy
@export var move_speed:float = 30.0

var base: PhysicsBody2D

func Enter():
	base = get_tree().get_first_node_in_group("Base")

func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	if base:
		var direction = base.global_position - enemy.global_position
		#print_debug(direction.length())
		if direction.length() > enemy.distancia_colisao:
			enemy.velocity = direction.normalized()*move_speed
		else:
			print_debug("Alcancei a base")
			enemy.velocity = Vector2()
			Transitioned.emit(self,"attack")
		#if direction.length() > 500:
			#Transitioned.emit(self,"idle")
	else:
		Transitioned.emit(self,"idle")
