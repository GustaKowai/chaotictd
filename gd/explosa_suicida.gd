extends AnimatedSprite2D
@onready var area_dano: Area2D = $AreaDano
@export var dano:int
var ja_explodiu:bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not ja_explodiu:
		var alvos = area_dano.get_overlapping_bodies()
		if alvos.size()>0:
			print_debug("atingi esses: ",alvos)
			ja_explodiu = true
			for alvo in alvos:
				if alvo.is_in_group("torre"):
					alvo.take_damage(dano)

func _on_animation_finished() -> void:
	queue_free()
