extends Building

class_name Heavy_Cannon_Torre

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var mira: Marker2D = %Mira
@onready var animation_player: AnimationPlayer = $AnimationPlayer

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

func _process(delta: float) -> void:
	sprite_2d.look_at(get_global_mouse_position())

func _physics_process(delta: float) -> void:
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


func charge():
	animation_player.play("carregar")

func upgrade_1_1():
	animation_player.speed_scale = 1.2

func upgrade_2_1():
	perfuracao_bonus = 1

func upgrade_3_2():
	animation_player.speed_scale = 3.0
	
func upgrade_3_3():
	bullet = bullet_chain
