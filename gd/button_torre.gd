extends Button
@export var torre:PackedScene
@export var fantasma_torre:PackedScene
var tower:Building
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tower = torre.instantiate()
	text = str(tower.value)
	icon = tower.sprite2d.texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.piece_count < tower.value:
		self.disabled = true
	else:
		self.disabled = false


func _on_pressed() -> void:
	if !GameManager.posicionando:
		GameManager.posicionando = true
		var t:Ghost_tower = fantasma_torre.instantiate()
		t.torre = torre
		t.sprite2D = tower.sprite2d
		t.collision_shape = tower.collision_shape
		owner.add_child(t)
