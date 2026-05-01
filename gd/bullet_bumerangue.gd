extends Bullet
@export var bullet_duracao = 0.48
var bullet_tempodevida = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT_IN)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self,"speed",-speed, bullet_duracao)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bullet_tempodevida += delta
	if bullet_tempodevida > bullet_duracao:
		queue_free()

#func _on_body_entered(body):
	##print_debug(body)
	#if body.is_in_group("Enemy"):
		#body.take_damage(damage)
		
func hit():
	pass
