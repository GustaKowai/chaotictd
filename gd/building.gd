extends StaticBody2D
class_name Building

@onready var upgrade_ui: upgrade_UI = $Upgrade_UI
@onready var progress_bar: TextureProgressBar = $ProgressBar
@onready var progress_bar2: TextureProgressBar = $ProgressBar2
@export var sprite2d:Sprite2D
@export var collision_shape:CollisionShape2D
@export var max_health:int = 100
@export var value:int
@export var death_prefab:PackedScene
var shield:int:
	set(new_value):
		shield = new_value
		progress_bar2.value = new_value #Se for usar uma barra de escudo também, sendo em baixo ou sobre a vida
var current_health: int :
	set(new_value):
		current_health = new_value
		progress_bar.value = new_value
func _ready() -> void:
	progress_bar.max_value = max_health
	progress_bar2.max_value = max_health
	current_health = max_health
	GameManager.game_over.connect(game_over)
	connect_upgrades()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func take_damage(damage:int):
	if shield > 0:
		damage_to_shield(damage)
		return
	current_health -= damage
	if current_health <= 0:
		die()

func heal_damage(heal:int):
	if current_health+heal < max_health:
		current_health += heal
	else:
		current_health = max_health

func die():
	if death_prefab:
		var death_object = death_prefab.instantiate()
		death_object.position = position
		get_parent().add_child(death_object)
	queue_free()
	
func damage_to_shield(amount:int):
	if amount < shield:
		shield -= amount
		#modulate = Color.CYAN
		#var tween = create_tween()
		#tween.set_ease(Tween.EASE_IN)
		#tween.set_trans(Tween.TRANS_QUINT)
		#tween.tween_property(self,"modulate",Color.WHITE,0.3)
		#print_debug(player_shield)
	else:
		amount -= shield
		shield = 0
		take_damage(amount)
		
func add_shield(amount:int):
	shield += amount
	
func set_shield(amount:int):
	#print_debug(self)
	shield = amount
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		upgrade_ui.show()
		# Use o seguinte para os upgrades:
		#print_debug(upgrade_ui.rota_1_1.button_pressed)

func game_over():
	var tempo = global_position.distance_to(GameManager.posicao_base)/800
	await get_tree().create_timer(tempo).timeout
	die()

#region upgrades
func connect_upgrades():
	upgrade_ui.rota_1_1.pressed.connect(upgrade_1_1)
	upgrade_ui.rota_1_2.pressed.connect(upgrade_1_2)
	upgrade_ui.rota_1_3.pressed.connect(upgrade_1_3)
	upgrade_ui.rota_2_1.pressed.connect(upgrade_2_1)
	upgrade_ui.rota_2_2.pressed.connect(upgrade_2_2)
	upgrade_ui.rota_2_3.pressed.connect(upgrade_2_3)
	upgrade_ui.rota_3_1.pressed.connect(upgrade_3_1)
	upgrade_ui.rota_3_2.pressed.connect(upgrade_3_2)
	upgrade_ui.rota_3_3.pressed.connect(upgrade_3_3)
	upgrade_ui.vender.pressed.connect(vender)
	
func upgrade_1_1():
	print_debug("upado 1_1")
func upgrade_1_2():
	print_debug("upado 1_2")
func upgrade_1_3():
	print_debug("upado 1_3")
func upgrade_2_1():
	print_debug("upado 2_1")
func upgrade_2_2():
	print_debug("upado 2_2")
func upgrade_2_3():
	print_debug("upado 2_3")
func upgrade_3_1():
	print_debug("upado 3_1")
func upgrade_3_2():
	print_debug("upado 3_2")
func upgrade_3_3():
	print_debug("upado 3_3")
	
func vender():
	GameManager.piece_count += ceil(value/2)
	GameManager.piece_collected.emit()
	die()
#endregion
		
