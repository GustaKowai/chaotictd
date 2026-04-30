extends CharacterBody2D
class_name Enemy
### Classe Inimigo, usado de base para todos os inimigos.
### A Classe base tem um Sprite, CollisionShape2D, State_Machine, ProgressBar e HitBox.


@onready var progress_bar: ProgressBar = $ProgressBar
@onready var sprite: Sprite2D = $Sprite
@export_category("Life")
#@export var distancia_colisao:float
@export var max_health:int = 10
@export var death_prefab:PackedScene
@export var color_damage:Color
@export_category("pieces")
@export var pieces:PackedScene
@export_range(0,1) var pieces_rate:float = 0.5
@export var number_pieces_min:int = 1
@export var number_pieces_max:int = 1
@export var spread_area_radius:float = 10.0

var alvo:Building  #Utilizado para inimigos que podem mudar de alvo

var current_health: int :
	set(new_value):
		current_health = new_value
		progress_bar.value = new_value

func _ready() -> void:
	progress_bar.max_value = max_health
	current_health = max_health

func _physics_process(delta: float) -> void:
	move_and_slide()

func _process(delta: float) -> void:
	if !velocity.is_zero_approx():
		sprite.look_at(global_position+velocity)


func take_damage(damage:int):
	current_health -= damage
	blink_damage()
	if current_health <= 0:
		die()

func blink_damage():
	modulate = color_damage
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self,"modulate",Color.WHITE,0.3)

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
	await drop_pieces()
	queue_free()
	
	
func drop_pieces():
	if not pieces:
		#print ("Não dropo peças")
		return
	if randf() > pieces_rate: return #Checa se ele dropará um item baseado na taxa de drop do monstro
	var number_pieces = randi_range(number_pieces_min,number_pieces_max)
	for n in range(1,number_pieces):
		var position_spread:Vector2 = Vector2(randf_range(-1,1),randf_range(-1,1))*spread_area_radius
		#print_debug(position_spread)
		var item = pieces.instantiate()
		item.position = position+position_spread
		get_parent().add_child(item)
