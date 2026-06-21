extends Bullet
class_name Bullet_slow
var slow_value:float = 1.0

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _on_area_entered(body):
	#print_debug(body)
	if body.is_in_group("Enemy"):
		var target:Enemy = body.get_parent()
		#print_debug(target.slow_time, " ", target.velocity)
		apply_slow(target)
		if retira_cammo:
			remove_cammo(body)
		target.take_damage(damage)
		hit()


func _on_body_entered(_body):
	pass # Replace with function body.

func apply_slow(target):
	if target.slow_time > slow_value:
			target.slow_time=slow_value

func remove_cammo(body):
	var target:Enemy = body.get_parent()
	body.set_collision_layer_value(2,true)
	target.sprite.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
