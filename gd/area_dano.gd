extends Area2D
@export var dano_area:int 
@export var pieces:PackedScene
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var retira_cammo:bool = false
var upgrade_money:bool = false
var tempo:float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tempo += delta


func _on_timer_timeout():
	print_debug("acabou o tempo ",tempo)
	causar_dano()
	
func causar_dano():
	animated_sprite_2d.play("chock")
	get_parent().blink_damage(Color(1.476, 1.476, 0.0, 1.0))
	print_debug("tentou_causar_dano")
	var inimigos = get_overlapping_areas()
	#print_debug(inimigos)
	for inimigo in inimigos:
		if inimigo.is_in_group("Enemy"):
			var inimigo_body:Enemy = inimigo.get_parent()
			inimigo_body.take_damage(dano_area)
			if retira_cammo:
				inimigo.set_collision_layer_value(2,true)
				inimigo_body.sprite.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
			if upgrade_money:
				if inimigo_body.pieces == pieces:
					inimigo_body.number_pieces_max = 2*inimigo_body.number_pieces_min
					
