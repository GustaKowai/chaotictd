extends State
class_name  EnemyFollow

@export var enemy: Enemy #O inimigo que está com esse módulo
@export var move_speed:float = 30.0 #Velocidade de movimento do inimigo

var base: PhysicsBody2D

func Enter():
	base = get_tree().get_first_node_in_group("Base")
	#print_debug("Follow")
	enemy.alvo = base

func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):		
	if enemy.alvo:
		var direction = enemy.alvo.global_position - enemy.global_position
		#print_debug(direction.length())
		if enemy.get_slide_collision_count() == 0:
			
			enemy.velocity = direction.normalized()*move_speed
		else:
			var collision := enemy.get_slide_collision(0)
			var body := collision.get_collider()
			#print_debug("Alcancei")
			enemy.alvo = body
			enemy.velocity = Vector2()
			Transitioned.emit(self,"attack")
		#if direction.length() > 500:
			#Transitioned.emit(self,"idle")
	else:
		lost_target()
		
func lost_target():
	Transitioned.emit(self,"idle")
