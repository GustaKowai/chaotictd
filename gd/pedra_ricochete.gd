extends Bullet


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if global_position.y < 0 or global_position.y > 1080:
		speed_vector = speed_vector*Vector2(1,-1)
	if global_position.x < 0 or global_position.x > 1920:
		speed_vector = speed_vector*Vector2(-1,1)
	#print_debug(get_viewport_rect().size.x)
	#print_debug(perfuracao,inimigos_atingidos)
	if inimigos_atingidos >= perfuracao:
		queue_free()
	inimigos_atingidos += 1


func _on_body_entered(_body: Node2D) -> void:
	pass # Replace with function body.
