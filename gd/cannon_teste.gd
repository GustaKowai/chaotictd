extends Cannon_tower
@onready var animated_sprite_2d: AnimatedSprite2D = $Sprite2D/AnimatedSprite2D
@export var bullet_ricochete:PackedScene
@export var bullet_teleguiada:PackedScene
@export var bullet_pedra:PackedScene
var upgrade_tiro_duplo:bool = false
@onready var mira_2: Marker2D = %Mira2

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
	cor_da_municao = Color(1.0, 0.431, 0.431, 1.0)
	animated_sprite_2d.modulate = cor_da_municao
func upgrade_2_2():
	perfuracao_bonus= 2
	cor_da_municao = Color(2.454, 1.1, 1.1, 1.0)
	animated_sprite_2d.modulate = cor_da_municao
func upgrade_2_3():
	perfuracao_bonus = 3
	bullet = bullet_ricochete


func upgrade_3_1():
	can_see_cammo = true
func upgrade_3_2():
	upgrade_tiro_duplo = true
func upgrade_3_3():
	bullet = bullet_teleguiada

func shoot():
	super()
	if upgrade_tiro_duplo:
		back_shoot()
		
func back_shoot():
	var b:Bullet = bullet.instantiate()
	b.damage += bullet_extra_damage
	b.perfuracao = perfuracao_bonus
	b.speed += speed_bonus
	b.modulate = cor_da_municao
	if can_see_cammo:
		b.set_collision_mask_value(6,true)
	if retira_cammo:
		b.retira_cammo = true
	get_tree().root.get_node("Main").add_child(b)
	b.transform = mira_2.global_transform
	b.scale = Vector2(1.0,1.0)
