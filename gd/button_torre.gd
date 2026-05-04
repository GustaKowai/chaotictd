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
	if !GameManager.posicionando:
		GameManager.posicionando = true
		var t:Ghost_tower = fantasma_torre.instantiate()
		var tower:Building = torre.instantiate()
		t.torre = torre
		t.sprite2D = tower.sprite2d
		t.collision_shape = tower.collision_shape
		owner.add_child(t)
