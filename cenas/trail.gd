extends Line2D

@export var comprimento:int = 50
var point:Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = Vector2(0,0)
	global_rotation = 0
	
	point = get_parent().global_position
	
	add_point(point)
	#print_debug(get_point_count())
	
	while get_point_count()>comprimento:
		remove_point(0)
