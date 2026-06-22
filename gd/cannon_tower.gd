extends Building
class_name Cannon_tower
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var cannon_teste: StaticBody2D = $"."
@onready var mira: Marker2D = %Mira
var bullet_extra_damage:int = 0
var perfuracao_bonus:int = 0
var speed_bonus:int = 0
var can_see_cammo:bool
var retira_cammo:bool
var cor_da_municao:Color = Color.WHITE

@export var delay_shoot: float = 5
@export var bullet: PackedScene
var delay:float


func _process(_delta: float) -> void:
	sprite_2d.look_at(get_global_mouse_position())

func _physics_process(delta: float) -> void:
	delay -= delta
	if delay <= 0:
		shoot()
		delay = delay_shoot
		
func shoot():
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
	b.transform = mira.global_transform
	b.scale = Vector2(1.0,1.0)
