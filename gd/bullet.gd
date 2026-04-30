extends Area2D
class_name Bullet

@export var speed:float
@export var damage:int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta

func _on_body_entered(body):
	#print_debug(body)
	if body.is_in_group("Enemy"):
		body.take_damage(damage)
		hit()
		
func hit():
	queue_free()
