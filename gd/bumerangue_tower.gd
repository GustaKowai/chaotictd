extends Cannon_tower
@export var bala_bumerangue_dano_duplo:PackedScene

func _ready() -> void:
	super()
	perfuracao_bonus = 2

func upgrade_1_1() -> void:
	delay_shoot = 0.2
	
func upgrade_1_2():
	bullet_extra_damage += 20

func upgrade_2_1():
	perfuracao_bonus = 4

func upgrade_2_2():
	perfuracao_bonus = -1
	
func upgrade_2_3():
	bullet = bala_bumerangue_dano_duplo
	
func upgrade_3_1():
	can_see_cammo = true

func upgrade_3_2():
	speed_bonus = 300
