extends Area2D
@export var dano_area:int 
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var retira_cammo:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	causar_dano()
	
func causar_dano():
	animated_sprite_2d.play("attack")
	#print_debug("tentou_causar_dano")
	var inimigos = get_overlapping_areas()
	#print_debug(inimigos)
	for inimigo in inimigos:
		if inimigo.is_in_group("Enemy"):
			inimigo.get_parent().take_damage(dano_area)
			if retira_cammo:
				inimigo.set_collision_layer_value(2,true)
				inimigo.get_parent().sprite.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
