extends PopupPanel
class_name upgrade_UI

@export var torre: Building
@onready var texture_rect: TextureRect = $PanelContainer/VBoxContainer/TextureRect
@onready var rota_1_1: CheckBox = %rota1_1
@onready var rota_1_2: CheckBox = %rota1_2
@onready var rota_1_3: CheckBox = %rota1_3
@onready var rota_2_1: CheckBox = %rota2_1
@onready var rota_2_2: CheckBox = %rota2_2
@onready var rota_2_3: CheckBox = %rota2_3
@onready var rota_3_1: CheckBox = %rota3_1
@onready var rota_3_2: CheckBox = %rota3_2
@onready var rota_3_3: CheckBox = %rota3_3
@export var rota_1_1_text: String
@export var rota_1_2_text: String
@export var rota_1_3_text: String
@export var rota_2_1_text: String
@export var rota_2_2_text: String
@export var rota_2_3_text: String
@export var rota_3_1_text: String
@export var rota_3_2_text: String
@export var rota_3_3_text: String

const MAX_UPGRADES:int = 4
var atual_upgade:int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print_debug(torre.sprite2d,torre)
	texture_rect.texture = torre.sprite2d.texture
	rota_1_1.tooltip_text = rota_1_1_text
	rota_1_2.tooltip_text = rota_1_2_text
	rota_1_3.tooltip_text = rota_1_3_text
	rota_2_1.tooltip_text = rota_2_1_text
	rota_2_2.tooltip_text = rota_2_2_text
	rota_2_3.tooltip_text = rota_2_3_text
	rota_3_1.tooltip_text = rota_3_1_text
	rota_3_2.tooltip_text = rota_3_2_text
	rota_3_3.tooltip_text = rota_3_3_text
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_rota_1_1_pressed() -> void:
	rota_1_1.disabled = true
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return
	rota_1_2.disabled = false
	


func _on_rota_1_2_pressed() -> void:
	rota_1_2.disabled = true
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return
	rota_1_3.disabled = false


func _on_rota_1_3_pressed() -> void:
	rota_1_3.disabled = true
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return


func _on_rota_2_1_pressed() -> void:
	rota_2_1.disabled = true
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return
	rota_2_2.disabled = false


func _on_rota_2_2_pressed() -> void:
	rota_2_2.disabled = true
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return
	rota_2_3.disabled = false


func _on_rota_2_3_pressed() -> void:
	rota_2_3.disabled = true
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return


func _on_rota_3_1_pressed() -> void:
	rota_3_1.disabled = true
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return
	rota_3_2.disabled = false


func _on_rota_3_2_pressed() -> void:
	rota_3_2.disabled = true
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return
	rota_3_3.disabled = false


func _on_rota_3_3_pressed() -> void:
	rota_3_3.disabled = true
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return

func disable_all():
	rota_1_1.disabled = true
	rota_1_2.disabled = true
	rota_1_3.disabled = true
	rota_2_1.disabled = true
	rota_2_2.disabled = true
	rota_2_3.disabled = true
	rota_3_1.disabled = true
	rota_3_2.disabled = true
	rota_3_3.disabled = true
