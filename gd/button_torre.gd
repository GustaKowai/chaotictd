extends Button
@export var torre:PackedScene
@export var fantasma_torre:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	var t = fantasma_torre.instantiate()
	t.torre = torre
	owner.add_child(t)
