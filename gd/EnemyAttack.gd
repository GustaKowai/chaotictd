extends State
class_name EnemyAttack

@export var enemy:Enemy #O inimigo que está com esse módulo
@export var area_dano:Area2D #A área que o inimigo irá causar dano
@export var dano:int #Quantidade de dano causado por ataque
@export var delay_attack:float #Tempo entre os ataques
var delay:float

func Enter():
	#print_debug("Modo de ataque")
	delay = delay_attack

func Exit():
	pass
	
func Update(delta: float):
	if !enemy.alvo:
		Transitioned.emit(self,"hunt")
		Transitioned.emit(self,"follow")
	else:
		charge_attack(delta)
	
func Physics_update(_delta: float):
	pass

func charge_attack(delta):
	delay -= delta
	if delay <= 0:
		attack()
		delay = delay_attack
	else:
		pass
		
func attack():
	#print_debug("ataquei")
	var alvos = area_dano.get_overlapping_bodies()
	for alvo in alvos:
		if alvo.is_in_group("torre"):
			alvo.take_damage(dano)
