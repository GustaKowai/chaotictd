extends Area2D
class_name Ghost_tower
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@export var torre :PackedScene
var sprite2D:Sprite2D
var collision_shape:CollisionShape2D
var pode_colocar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.texture = sprite2D.texture
	collision_shape_2d.shape = collision_shape.shape
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
		#print_debug(t)
		#print_debug(get_parent())
		get_parent().add_child(t)
		queue_free()
