extends Area2D
@export var shield_value:int
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
var torres:Array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	WaveManager.start_wave.connect(criar_escudo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func criar_escudo(wave):
	animated_sprite_2d.play("smile")
	print_debug("tentou criar escudo")
	#torres = get_overlapping_bodies()
	#print_debug(torres)
	#print_debug(inimigos)
	for torre in torres:
		if torre.is_in_group("torre"):
			torre.set_shield(shield_value)

#
func _on_body_entered(body: Node2D) -> void:
	print_debug(body)
	torres.append(body)


func _on_body_exited(body: Node2D) -> void:
	print_debug(body)
	torres.erase(body)
