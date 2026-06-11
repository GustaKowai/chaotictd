extends Cannon_tower
@onready var animated_sprite_2d: AnimatedSprite2D = $Sprite2D/AnimatedSprite2D

func upgrade_1_1():
	delay_shoot *= 0.5
	animated_sprite_2d.speed_scale *= 2
func upgrade_1_2():
	delay_shoot *= 0.5
	animated_sprite_2d.speed_scale *= 2
func upgrade_1_3():
	pass
	
func upgrade_2_1():
	bullet_extra_damage += 2
func upgrade_2_2():
	bullet_extra_damage += 2

func upgrade_3_1():
	can_see_cammo = true
func upgrade_3_2():
	perfuracao_bonus = 2
