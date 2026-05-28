extends Debuff
@onready var area_2d: Area2D = $Area2D
@export var damage:int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if damage == 200:
		var bodies = area_2d.get_overlapping_areas()
		damage += 1
	


func _on_timer_timeout() -> void:  #TODO quando tiver um efeito de explosão, substituir por tree_exiting
	print_debug("boom")
	var bodies = area_2d.get_overlapping_areas()
	print_debug(bodies)
	for body in bodies:
		print_debug(body)
		if body.is_in_group("Enemy"):
			var target = body.get_parent()
			target.take_damage(damage)
	queue_free()
