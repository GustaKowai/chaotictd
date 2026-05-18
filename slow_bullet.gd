extends Bullet

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _on_area_entered(body):
	#print_debug(body)
	if body.is_in_group("Enemy"):
		var target:Enemy = body.get_parent()
		target.take_damage(damage)
		hit()
