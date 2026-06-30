extends Bullet
class_name Bullet_chain
var distance:float
var enemy_hit:Area2D

func hit():
	#print_debug(enemy_hit," ",scale)
	if damage >= 1:
		duplicate_self()
	super()
	
func duplicate_self():
	var area_teste = get_overlapping_areas()
	print_debug(area_teste)
	for teste in area_teste:
		if teste.is_in_group("Enemy"):
			#print_debug("achei a área que não posso acertar, é a: ",teste)
			enemy_hit = teste
	for i in [-1,1]:
		var _self_scene = PackedScene.new()
		_self_scene.pack(self)
		var instance:Bullet_chain = _self_scene.instantiate()
		get_tree().root.get_node("Main").add_child(instance)
		instance.enemy_hit = enemy_hit
		instance.transform = global_transform
		#instance.position.x += 30
		instance.scale *= 0.7
		@warning_ignore("narrowing_conversion")
		instance.damage *=0.7
		#print_debug(instance.damage)
		instance.rotate(PI*i/2)
		
func damage_enemy(body:Area2D):
	#print_debug(enemy_hit)
	if body == enemy_hit:
		#print_debug("quase acertei o mesmo alvo")
		return
	super(body)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
