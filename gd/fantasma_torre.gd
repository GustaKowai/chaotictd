extends Node2D
@export var torre :PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()



func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		var t = torre.instantiate()
		t.global_position = global_position
		print_debug(t)
		print_debug(get_parent())
		get_parent().add_child(t)
		queue_free()
