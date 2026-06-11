extends Cannon_tower
var slow_bonus:float

func shoot():
	var b:Bullet = bullet.instantiate()
	b.damage += bullet_extra_damage
	b.perfuracao = perfuracao_bonus
	b.slow_value -= slow_bonus
	print_debug(b.slow_value," ", slow_bonus)
	if can_see_cammo:
		b.set_collision_mask_value(6,true)
	if retira_cammo:
		b.retira_cammo = true
	get_tree().root.get_node("Main").add_child(b)
	b.transform = mira.global_transform
	b.scale = Vector2(1.0,1.0)

func upgrade_1_1():
	delay_shoot = 0.5

func upgrade_2_1():
	slow_bonus = 0.2

func upgrade_2_2():
	can_see_cammo = true
	retira_cammo = true

func upgrade_3_1():
	bullet_extra_damage = 10

func upgrade_3_3():
	pass #TODO colocar a bomba, lembrar de adicionar para a bomba poder dar slow para não conflitar com o upgrade 2-1
