extends EnemyFollow
class_name  EnemyHunt
var chasing:bool = false

@export var area_alerta:Area2D
var alvo:Building

func Enter():
	super()
	alvo = base
	#print_debug(alvo)
	area_alerta.connect("body_entered",Callable(self,"_on_body_entered"))

func Physics_update(_delta: float):
	if alvo:
		var direction = alvo.global_position - enemy.global_position
		#print_debug(direction.length())
		if direction.length() > 25:
			enemy.velocity = direction.normalized()*move_speed
		else:
			enemy.velocity = Vector2()
			Transitioned.emit(self,"attack")
		#if direction.length() > 500:
			#Transitioned.emit(self,"idle")
	else:
		if base:
			chasing = false
			alvo = base
		else:
			Transitioned.emit(self,"idle")

func _on_body_entered(body):
	#print_debug("conexão",chasing,body)
	if body.is_in_group("torre") and !chasing:
		#print_debug("alvo detectado")
		alvo = body
		chasing = true
	else:
		pass
