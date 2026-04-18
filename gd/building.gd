extends StaticBody2D
class_name Building

@onready var progress_bar: ProgressBar = $ProgressBar

@export var max_health:int = 100
var current_health: int :
	set(new_value):
		current_health = new_value
		progress_bar.value = new_value
		
func _ready() -> void:
	progress_bar.max_value = max_health
	current_health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func take_damage(damage:int):
	current_health -= damage
	if current_health <= 0:
		die()

func heal_damage(heal:int):
	if current_health+heal < max_health:
		current_health += heal
	else:
		current_health = max_health

func die():
	queue_free()
