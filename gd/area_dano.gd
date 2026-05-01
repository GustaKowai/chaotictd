extends Area2D
@export var dano_area:int 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	causar_dano()
	
func causar_dano():
	#print_debug("tentou_causar_dano")
	var inimigos = get_overlapping_areas()
	#print_debug(inimigos)
	for inimigo in inimigos:
		if inimigo.is_in_group("Enemy"):
			inimigo.get_parent().take_damage(dano_area)
