extends Building
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var cannon_teste: StaticBody2D = $"."
@onready var mira: Marker2D = $Sprite2D/Cannon/Mira

@export var delay_shoot: float = 5
@export var bullet: PackedScene
var delay:float


func _process(delta: float) -> void:
	sprite_2d.look_at(get_global_mouse_position())

func _physics_process(delta: float) -> void:
	delay -= delta
	if delay <= 0:
		shoot()
		delay = delay_shoot
		
func shoot():
	var b = bullet.instantiate()
	owner.add_child(b)
	b.transform = mira.global_transform
