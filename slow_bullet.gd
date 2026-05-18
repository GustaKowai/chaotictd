extends Bullet

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _on_area_entered(body):
	#print_debug(body)
	if body.is_in_group("Enemy"):
		var target:Enemy = body.get_parent()
		target.state_machine.slow_time=0.5
		target.take_damage(damage)
		print_debug(target,target.state_machine,target.state_machine.slow_time)
		hit()


func _on_body_entered(body):
	pass # Replace with function body.
