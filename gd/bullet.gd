extends Area2D
class_name Bullet
@warning_ignore("shadowed_global_identifier")
@export var impact:PackedScene

@export var speed:float
@export var damage:int
@export var perfuracao:int = 0 #quantidade de inimigos além do primeiro que a bala pode acertar antes de desaparecer. Número negatico de perfuração indica que ela é infinita.
var inimigos_atingidos:int = 0
var retira_cammo:bool = false
var speed_vector:Vector2
func _ready() -> void:
	speed_vector = Vector2(speed,speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	#print_debug(transform.x)
	position += transform.x * speed_vector * delta

func _on_area_entered(body):
	#print_debug(body)
	damage_enemy(body)
		
func hit():
	if impact:
		var i = impact.instantiate()
		i.transform = transform
		get_tree().root.get_node("Main").add_child(i)
	if perfuracao <0:
		return
	if inimigos_atingidos >= perfuracao:
		queue_free()
	else:
		inimigos_atingidos += 1

func damage_enemy(body):
	if body.is_in_group("Enemy"):
		var target = body.get_parent()
		target.take_damage(damage)
		if retira_cammo:
			body.set_collision_layer_value(2,true)
			target.sprite.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
		hit()
