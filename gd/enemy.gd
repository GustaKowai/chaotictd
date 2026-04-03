extends CharacterBody2D
class_name Enemy

func _physics_process(delta: float) -> void:
	move_and_slide()

func _process(delta: float) -> void:
	if !velocity.is_zero_approx():
		look_at(global_position+velocity)
