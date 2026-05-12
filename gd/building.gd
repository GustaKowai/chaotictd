extends StaticBody2D
class_name Building

@onready var progress_bar: TextureProgressBar = $ProgressBar
@export var sprite2d:Sprite2D
@export var collision_shape:CollisionShape2D
@export var max_health:int = 100
@export var value:int
var shield:int:
	set(new_value):
		current_health = new_value
		#progress_bar.value = new_value #Se for usar uma barra de escudo também, sendo em baixo ou sobre a vida
var current_health: int :
	set(new_value):
		current_health = new_value
		progress_bar.value = new_value
		
func _ready() -> void:
	progress_bar.max_value = max_health
	current_health = max_health


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
	shield = amount
