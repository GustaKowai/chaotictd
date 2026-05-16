extends Enemy
@export var area_dano: Area2D
@export var dano:int

func die():
	var alvos = area_dano.get_overlapping_bodies()
	for alvo in alvos:
		if alvo.is_in_group("torre"):
			alvo.take_damage(dano)
	super()
