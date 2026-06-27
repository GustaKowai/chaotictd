extends Building

class_name Heavy_Cannon_Torre

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var mira: Marker2D = %Mira
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var cannon: Sprite2D = $Sprite2D/Cannon

@export var delay_shoot: float = 5 #Delay do tiro do canhao
@export var bullet: PackedScene
@export var bullet_chain:PackedScene
var delay: float
var perfuracao_bonus:int = 0
var can_see_cammo:bool
var bullet_extra_damage:int = 0

func _ready() -> void:
	super()
	animation_player.speed_scale = 7.5/delay_shoot

func _process(_delta: float) -> void:
	sprite_2d.look_at(get_global_mouse_position())

func _physics_process(_delta: float) -> void:
	#delay -= delta
	#if delay <= 0:
		#shoot()
		#delay = delay_shoot
	pass
	
func shoot():
	#print_debug(animation_player.speed_scale)
	var b:Bullet = bullet.instantiate()
	b.damage += bullet_extra_damage
	b.perfuracao = perfuracao_bonus
	if can_see_cammo:
		b.set_collision_mask_value(6,true)
	get_tree().root.get_node("Main").add_child(b)
	b.transform = mira.global_transform

func shoot6():
	for cannon_mira in cannon.get_children():
		var b:Bullet = bullet.instantiate()
		b.damage += bullet_extra_damage
		b.perfuracao = perfuracao_bonus
		if can_see_cammo:
			b.set_collision_mask_value(6,true)
		print_debug(cannon_mira)
		get_tree().root.get_node("Main").add_child(b)
		b.transform = cannon_mira.global_transform
		b.scale *= 0.5
		
func charge():
	animation_player.play("carregar")

func upgrade_1_1():
	animation_player.speed_scale = 1.2
	
func upgrade_1_2():
	delay_shoot = 4.0
	animation_player.speed_scale = 7.5/delay_shoot
	
func upgrade_1_3():
	animation_player.play("carregar_6")
	
func upgrade_2_1():
	pass

func upgrade_2_2():
	perfuracao_bonus = 1

	
func upgrade_2_3():
	perfuracao_bonus = -1
	
func upgrade_3_1():
	bullet_extra_damage=250

func upgrade_3_2():
	bullet_extra_damage=550
	
func upgrade_3_3():
	bullet = bullet_chain
