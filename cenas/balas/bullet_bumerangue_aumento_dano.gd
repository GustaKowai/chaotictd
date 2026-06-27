extends bullet_bumerangue
var multiplicador_de_dano:int = 1
var dano_base:int

func _ready() -> void:
	super()
	dano_base = damage

func hit():
	super()
	multiplicador_de_dano += 1
	damage = dano_base * multiplicador_de_dano
	scale = Vector2(multiplicador_de_dano,multiplicador_de_dano)
