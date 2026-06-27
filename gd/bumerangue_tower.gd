extends Cannon_tower
@export_group("Upgrades balas")
@export var bala_bumerangue_dano_duplo:PackedScene
@export var bala_bumerangue_aumenta_dano:PackedScene
@export var bala_bumerangue_foice:PackedScene
@export_group("Upgrades textures")
@export var texture_upada_dano_duplo:Texture2D
@export var textura_upada_base_dano_duplo:Texture2D
@export var texture_upada_dano_aumenta:Texture2D
@export var texture_upada_executor:Texture2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Sprite2D/AnimatedSprite2D
var contador_de_tiro:int = 0
@onready var timer: Timer = $Timer
@onready var sprite_2d_base: Sprite2D = $Sprite2D/Sprite2DBase


func _ready() -> void:
	super()
	perfuracao_bonus = 2

func upgrade_1_1() -> void:
	delay_shoot = 0.2
	animated_sprite_2d.speed_scale = 1.5
	
func upgrade_1_2():
	bullet_extra_damage += 20
	
func upgrade_1_3():
	bullet = bala_bumerangue_aumenta_dano

func upgrade_2_1():
	perfuracao_bonus = 4

func upgrade_2_2():
	perfuracao_bonus = -1
	
func upgrade_2_3():
	bullet = bala_bumerangue_dano_duplo
	animated_sprite_2d.play("dano_duplo")
	sprite_2d_base.texture = textura_upada_base_dano_duplo
	sprite_2d.texture = texture_upada_dano_aumenta
	sprite2d.texture = texture_upada_dano_duplo
	
func upgrade_3_1():
	can_see_cammo = true

func upgrade_3_2():
	speed_bonus = 400

func upgrade_3_3():
	timer.timeout.connect(shoot_foice)
	sprite2d.texture = texture_upada_executor

func shoot_foice():
	var f:Bullet = bala_bumerangue_foice.instantiate()
	f.damage += bullet_extra_damage
	f.perfuracao = perfuracao_bonus
	f.speed += speed_bonus
	f.modulate = cor_da_municao
	if can_see_cammo:
		f.set_collision_mask_value(6,true)
	if retira_cammo:
		f.retira_cammo = true
	f.transform = mira.global_transform
	get_tree().root.get_node("Main").add_child(f)
	f.scale = Vector2(1.0,1.0)
