extends CharacterBody2D
class_name Enemy
### Classe Inimigo, usado de base para todos os inimigos.
### A Classe base tem um Sprite, CollisionShape2D, State_Machine, ProgressBar e HitBox.


@onready var progress_bar: ProgressBar = $ProgressBar
@onready var sprite: Sprite2D = $Sprite

@export var max_health:int = 10
var current_health: int :
	set(new_value):
		current_health = new_value
		progress_bar.value = new_value

func _ready() -> void:
	progress_bar.max_value = max_health
	current_health = max_health

func _physics_process(delta: float) -> void:
	move_and_slide()

func _process(delta: float) -> void:
	if !velocity.is_zero_approx():
		sprite.look_at(global_position+velocity)


func take_damage(damage:int):
	current_health -= damage
	if current_health <= 0:
		queue_free()

func heal_damage(heal:int):
	if current_health+heal < max_health:
		current_health += heal
	else:
		current_health = max_health
