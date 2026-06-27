extends Sprite2D
var transparencia:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transparencia = 0.5
	
func _process(delta: float) -> void:
	fade(delta)
	
func fade(delta):
	if transparencia > 0:
		#print_debug(transparencia)
		modulate.a = transparencia
		transparencia -= 0.5*delta
	else:
		queue_free()
