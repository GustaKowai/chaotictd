extends Area2D
@export var torre :PackedScene
var pode_colocar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	if get_overlapping_bodies().size()>0:
		print_debug(get_overlapping_bodies())
		pode_colocar = false
		self.modulate = Color.RED
	else:
		pode_colocar = true
		self.modulate = Color.WHITE

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and pode_colocar:
		GameManager.posicionando = false
		var t = torre.instantiate()
		t.global_position = global_position
		print_debug(t)
		print_debug(get_parent())
		get_parent().add_child(t)
		queue_free()
