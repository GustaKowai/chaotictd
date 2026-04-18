extends EnemyFollow
class_name  EnemyHunt
var chasing:bool = false

@export var area_alerta:Area2D

func Enter():
	super()
	enemy.alvo = base
	chasing = false
	#print_debug(alvo)
	#area_alerta.connect("body_entered",Callable(self,"_on_body_entered"))

func Physics_update(_delta: float):
	chase()
	if enemy.alvo:
		var direction = enemy.alvo.global_position - enemy.global_position
		#print_debug(direction.length())
		if direction.length() > enemy.distancia_colisao:
			enemy.velocity = direction.normalized()*move_speed
		else:
			print_debug("Alcancei")
			enemy.velocity = Vector2()
			Transitioned.emit(self,"attack")
		#if direction.length() > 500:
			#Transitioned.emit(self,"idle")
	else:
		print_debug("Perdi o alvo")
		if base:
			chasing = false
			enemy.alvo = base
		else:
			Transitioned.emit(self,"idle")

#func _on_body_entered(body):
	#print_debug("conexão "," ",chasing," ",body," ",enemy.alvo)
	#if body.is_in_group("torre") and !chasing:
		##print_debug("alvo detectado")
		#enemy.alvo = body
		#chasing = true
		#print_debug("conexão",chasing,body,enemy.alvo)
	#else:
		#pass
		
func chase():
	if chasing:
		return
	var alvos = area_alerta.get_overlapping_bodies()
	for alvo in alvos:
		if alvo.is_in_group("torre"):
			enemy.alvo = alvo
			chasing = true
