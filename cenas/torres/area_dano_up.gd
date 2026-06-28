extends Area2D
@export var dano_area:int = 0


func deal_damage():
	var inimigos = get_overlapping_areas()
	#print_debug(inimigos)
	for inimigo in inimigos:
		if inimigo.is_in_group("Enemy"):
			var inimigo_body:Enemy = inimigo.get_parent()
			inimigo_body.take_damage(dano_area)
