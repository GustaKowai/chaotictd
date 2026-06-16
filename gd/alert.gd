extends AnimatedSprite2D
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print_debug("comecei a alertar")
	gpu_particles_2d.emitting = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_finished() -> void:
	#print_debug("acabei de alertar")
	#queue_free()
	pass


func _on_gpu_particles_2d_finished() -> void:
	queue_free()
