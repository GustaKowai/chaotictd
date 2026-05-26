extends Building

class_name Heavy_Cannon_Torre

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var mira: Marker2D = %Mira
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var delay_shoot: float = 5 #Delay do tiro do canhao
@export var bullet: PackedScene
var delay: float

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
	var b = bullet.instantiate()
	get_tree().root.add_child(b)
	b.transform = mira.global_transform
	
func _on_rota_1_1_pressed() -> void:
	pass # Replace with function body.

func charge():
	animation_player.play("carregar")
