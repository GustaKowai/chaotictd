extends Bullet
class_name bullet_bumerangue
@export var bullet_duracao = 0.48
var bullet_tempodevida = 0
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT_IN)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self,"speed",-speed, bullet_duracao)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bullet_tempodevida += delta
	sprite_2d.flip_h = speed < 0
	if bullet_tempodevida > bullet_duracao:
		queue_free()
		
func _physics_process(delta: float) -> void:
	#print_debug(transform.x)
	position += transform.x * speed * delta

#func _on_body_entered(body):
	##print_debug(body)
	#if body.is_in_group("Enemy"):
		#body.take_damage(damage)
		#
func hit():
	if impact:
		var i = impact.instantiate()
		i.transform = transform
		i.flip_h = sprite_2d.flip_h
		get_tree().root.get_node("Main").add_child.call_deferred(i)
		print_debug(perfuracao)
	if perfuracao <0:
		return
	if inimigos_atingidos >= perfuracao:
		queue_free()
	else:
		inimigos_atingidos += 1
