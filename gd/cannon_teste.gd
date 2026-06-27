extends Cannon_tower
@onready var animated_sprite_2d: AnimatedSprite2D = $Sprite2D/AnimatedSprite2D
@export var bullet_ricochete:PackedScene
@export var bullet_teleguiada:PackedScene
@export var bullet_pedra:PackedScene

func upgrade_1_1():
	delay_shoot *= 0.5
	animated_sprite_2d.speed_scale *= 2
func upgrade_1_2():
	delay_shoot *= 0.5
	animated_sprite_2d.speed_scale *= 2
func upgrade_1_3():
	bullet = bullet_pedra
	
func upgrade_2_1():
	bullet_extra_damage +=2
	cor_da_municao = Color(2.454, 1.1, 1.1, 1.0)
func upgrade_2_2():
	perfuracao_bonus= 2
func upgrade_2_3():
	perfuracao_bonus = 3
	bullet = bullet_ricochete


func upgrade_3_1():
	can_see_cammo = true
func upgrade_3_2():
	pass
func upgrade_3_3():
	bullet = bullet_teleguiada
