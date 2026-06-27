extends Node2D
@onready var label: Label = $Node2D/Label



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print_debug("dinheiro", global_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	queue_free()
