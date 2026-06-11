extends Cannon_tower
@export var slow_value:float
@export var bullet_stun:PackedScene
@export var bullet_bomb:PackedScene

func shoot():
	var b:Bullet = bullet.instantiate()
	b.damage += bullet_extra_damage
	b.perfuracao = perfuracao_bonus
	b.slow_value = slow_value
	#print_debug(b.slow_value," ")
	if can_see_cammo:
		b.set_collision_mask_value(6,true)
	if retira_cammo:
		b.retira_cammo = true
	get_tree().root.get_node("Main").add_child(b)
	b.transform = mira.global_transform
	b.scale = Vector2(1.0,1.0)

func upgrade_1_1():
	delay_shoot = 0.7

func upgrade_1_2():
	slow_value = 0.3
	
func upgrade_1_3():
	bullet = bullet_stun

func upgrade_2_1():
	can_see_cammo = true

func upgrade_2_3():
	retira_cammo = true

func upgrade_3_1():
	bullet_extra_damage = 10
	
func upgrade_3_2():
	bullet_extra_damage = 30

func upgrade_3_3():
	bullet = bullet_bomb
