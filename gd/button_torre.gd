extends Button
class_name tower_button
@export var hotkey:String
@export var torre:PackedScene
@export var fantasma_torre:PackedScene
var tower:Building
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tower = torre.instantiate()
	text = str(tower.value)
	icon = tower.sprite2d.texture
	tooltip_text = "Tecla de colocação rápida: "+hotkey

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.piece_count < tower.value:
		self.disabled = true
	else:
		self.disabled = false


func _on_pressed() -> void:
	put_tower()

func put_tower():
	if GameManager.piece_count < tower.value:
		return
	if !GameManager.posicionando:
		GameManager.posicionando = true
		var t:Ghost_tower = fantasma_torre.instantiate()
		t.torre = torre
		t.sprite2D = tower.sprite2d
		t.collision_shape = tower.collision_shape
		owner.add_child(t)
