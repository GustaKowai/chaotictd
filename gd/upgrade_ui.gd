extends PopupPanel
class_name upgrade_UI

@export var torre: Building
@onready var texture_rect: TextureRect = %TextureRect
@onready var vender: Button = %vender
@onready var rota_1_1: CheckBox = %rota1_1
@onready var rota_1_2: CheckBox = %rota1_2
@onready var rota_1_3: CheckBox = %rota1_3
@onready var rota_2_1: CheckBox = %rota2_1
@onready var rota_2_2: CheckBox = %rota2_2
@onready var rota_2_3: CheckBox = %rota2_3
@onready var rota_3_1: CheckBox = %rota3_1
@onready var rota_3_2: CheckBox = %rota3_2
@onready var rota_3_3: CheckBox = %rota3_3
@onready var upgrade_text: Label = %upgrade_text
@onready var info_container: PanelContainer = %info_container
const GLITCH = preload("uid://cjo3vujurf3ae")


#region export_vars
@export var rotas:Array[CheckBox]
@export var rota_disable:Dictionary[CheckBox,bool]
@export_category("Upgrades text")
@export_multiline var rota_1_1_text: String
@export_multiline var rota_1_2_text: String
@export_multiline var rota_1_3_text: String
@export_multiline var rota_2_1_text: String
@export_multiline var rota_2_2_text: String
@export_multiline var rota_2_3_text: String
@export_multiline var rota_3_1_text: String
@export_multiline var rota_3_2_text: String
@export_multiline var rota_3_3_text: String
@export_category("Upgrades price")
@export var rota_1_1_price:int
@export var rota_1_2_price:int
@export var rota_1_3_price:int
@export var rota_2_1_price:int
@export var rota_2_2_price:int
@export var rota_2_3_price:int
@export var rota_3_1_price:int
@export var rota_3_2_price:int
@export var rota_3_3_price:int

#endregion export_vars

#var rota_1_1_disable = false
#var rota_1_2_disable = true
#var rota_1_3_disable = true
#var rota_2_1_disable = false
#var rota_2_2_disable = true
#var rota_2_3_disable = true
#var rota_3_1_disable = false
#var rota_3_2_disable = true
#var rota_3_3_disable = true

var upgrade_size:Vector2

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
	rota_1_1.text = str(rota_1_1_price)
	rota_1_2.text = str(rota_1_2_price)
	rota_1_3.text = str(rota_1_3_price)
	rota_2_1.text = str(rota_2_1_price)
	rota_2_2.text = str(rota_2_2_price)
	rota_2_3.text = str(rota_2_3_price)
	rota_3_1.text = str(rota_3_1_price)
	rota_3_2.text = str(rota_3_2_price)
	rota_3_3.text = str(rota_3_3_price)
	upgrade_size = size
	
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_upgrades_ables()

#region on_pressed

func _on_rota_1_1_pressed() -> void:
	#rota_1_1_disable = true
	rota_disable[rota_1_1] = true
	GameManager.piece_count -=rota_1_1_price
	GameManager.piece_collected.emit()
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return
	#rota_1_2_disable = false
	rota_disable[rota_1_2] = false

func _on_rota_1_2_pressed() -> void:
	#rota_1_2_disable = true
	rota_disable[rota_1_2] = true
	GameManager.piece_count -=rota_1_2_price
	GameManager.piece_collected.emit()
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return
	#rota_1_3_disable = false
	rota_disable[rota_1_3] = false


func _on_rota_1_3_pressed() -> void:
	#rota_1_3_disable = true
	rota_disable[rota_1_3] = true
	GameManager.piece_count -=rota_1_3_price
	GameManager.piece_collected.emit()
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return


func _on_rota_2_1_pressed() -> void:
	#rota_2_1_disable = true
	rota_disable[rota_2_1] = true
	GameManager.piece_count -=rota_2_1_price
	GameManager.piece_collected.emit()
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return
	#rota_2_2_disable = false
	rota_disable[rota_2_2] = false


func _on_rota_2_2_pressed() -> void:
	#rota_2_2_disable = true
	rota_disable[rota_2_2] = true
	GameManager.piece_count -=rota_2_2_price
	GameManager.piece_collected.emit()
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return
	#rota_2_3_disable = false
	rota_disable[rota_2_3] = false


func _on_rota_2_3_pressed() -> void:
	#rota_2_3_disable = true
	rota_disable[rota_2_3] = true
	GameManager.piece_count -=rota_2_3_price
	GameManager.piece_collected.emit()
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return


func _on_rota_3_1_pressed() -> void:
	#rota_3_1_disable = true
	rota_disable[rota_3_1] = true
	GameManager.piece_count -=rota_3_1_price
	GameManager.piece_collected.emit()
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return
	#rota_3_2_disable = false
	rota_disable[rota_3_2] = false


func _on_rota_3_2_pressed() -> void:
	#rota_3_2_disable = true
	rota_disable[rota_3_2] = true
	GameManager.piece_count -=rota_3_2_price
	GameManager.piece_collected.emit()
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return
	#rota_3_3_disable = false
	rota_disable[rota_3_3] = false


func _on_rota_3_3_pressed() -> void:
	#rota_3_3.disabled = true
	rota_disable[rota_3_3] = true
	GameManager.piece_count -=rota_3_3_price
	GameManager.piece_collected.emit()
	atual_upgade += 1
	if atual_upgade >= MAX_UPGRADES:
		disable_all()
		return

func disable_all():
	for rota in rotas:
		rota_disable[rota] = true
	#rota_1_1_disable = true
	#rota_1_2_disable = true
	#rota_1_3_disable = true
	#rota_2_1_disable = true
	#rota_2_2_disable = true
	#rota_2_3_disable = true
	#rota_3_1_disable = true
	#rota_3_2_disable = true
	#rota_3_3_disable = true
	
func check_upgrades_ables():
	rota_1_1.disabled = (GameManager.piece_count < rota_1_1_price) or rota_disable[rota_1_1]
	rota_1_2.disabled = (GameManager.piece_count < rota_1_2_price) or rota_disable[rota_1_2]
	rota_1_3.disabled = (GameManager.piece_count < rota_1_3_price) or rota_disable[rota_1_3]
	rota_2_1.disabled = (GameManager.piece_count < rota_2_1_price) or rota_disable[rota_2_1]
	rota_2_2.disabled = (GameManager.piece_count < rota_2_2_price) or rota_disable[rota_2_2]
	rota_2_3.disabled = (GameManager.piece_count < rota_2_3_price) or rota_disable[rota_2_3]
	rota_3_1.disabled = (GameManager.piece_count < rota_3_1_price) or rota_disable[rota_3_1]
	rota_3_2.disabled = (GameManager.piece_count < rota_3_2_price) or rota_disable[rota_3_2]
	rota_3_3.disabled = (GameManager.piece_count < rota_3_3_price) or rota_disable[rota_3_3]
	change_theme_color()
	
#endregion on_pressed

func change_theme_color():
	for rota in rotas:
		if rota.disabled:
			if not rota_disable[rota]:
				rota.add_theme_color_override("font_disabled_color", Color("981300ff"))
			else:
				rota.add_theme_color_override("font_disabled_color", Color("c4cbcc76"))

func show_info(info):
	info_container.visible = true
	#print_debug(info)
	upgrade_text.text = info
	
func hide_info():
	if info_container:
		info_container.visible = false
		size = upgrade_size

func _on_visibility_changed() -> void:
	hide_info()
	#print_debug(size)
	#if texture_rect:
		#print_debug(texture_rect.size)

#region on_mouse_entered
func _on_rota_1_1_mouse_entered() -> void:
	#print_debug("entrou o mouse")
	show_info(rota_1_1_text)

func _on_rota_1_2_mouse_entered() -> void:
	#print_debug("entrou o mouse")
	show_info(rota_1_2_text)

func _on_rota_1_3_mouse_entered() -> void:
	#print_debug("entrou o mouse")
	show_info(rota_1_3_text)


func _on_rota_2_1_mouse_entered() -> void:
	#print_debug("entrou o mouse")
	show_info(rota_2_1_text)


func _on_rota_2_2_mouse_entered() -> void:
	#print_debug("entrou o mouse")
	show_info(rota_2_2_text)


func _on_rota_2_3_mouse_entered() -> void:
	#print_debug("entrou o mouse")
	show_info(rota_2_3_text)


func _on_rota_3_1_mouse_entered() -> void:
	#print_debug("entrou o mouse")
	show_info(rota_3_1_text)


func _on_rota_3_2_mouse_entered() -> void:
	#print_debug("entrou o mouse")
	show_info(rota_3_2_text)


func _on_rota_3_3_mouse_entered() -> void:
	#print_debug("entrou o mouse")
	show_info(rota_3_3_text)

#endregion

func _on_info_container_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		self.hide()
