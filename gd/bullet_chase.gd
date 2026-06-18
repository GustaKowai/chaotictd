extends Bullet
@onready var detection_area: Area2D = $Detection_area
var alvo:CharacterBody2D = null
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _ready() -> void:
	super()
	detection_area.collision_mask = collision_mask


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()



func _on_detection_area_area_entered(area: Area2D) -> void:
	if alvo:
		return
	if area.is_in_group("Enemy"):
		var target = area.get_parent()
		alvo = target
		
func _physics_process(delta: float) -> void:
	if not alvo:
		super(delta)
	else:
		var enemy_direction:Vector2
		enemy_direction = alvo.global_position-global_position
		enemy_direction = enemy_direction.normalized()
		position += speed_vector * delta * enemy_direction
