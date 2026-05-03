extends CharacterBody2D

var speed:float = 3
var input_vector:Vector2 = Vector2(0,0)
@export_range(0,1) var lerp_smoothness:float = 0.5

func _physics_process(delta: float) -> void:
	var target_velocity:Vector2 = input_vector*speed*100.0
	velocity = lerp(velocity,target_velocity,lerp_smoothness)
	move_and_slide()

func _process(delta: float) -> void:
	input_vector = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
