extends Area2D
class_name Bullet

@export var speed:float
@export var damage:int
@export var perfuracao:int = 0 #quantidade de inimigos além do primeiro que a bala pode acertar antes de desaparecer. Número negatico de perfuração indica que ela é infinita.
var inimigos_atingidos:int = 0
var retira_cammo:bool = false
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta

func _on_area_entered(body):
	#print_debug(body)
	if body.is_in_group("Enemy"):
		var target = body.get_parent()
		target.take_damage(damage)
		if retira_cammo:
			body.set_collision_layer_value(2,true)
			target.sprite.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
		hit()
		
func hit():
	if perfuracao <0:
		return
	if inimigos_atingidos >= perfuracao:
		queue_free()
	else:
		inimigos_atingidos += 1
