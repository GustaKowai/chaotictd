extends Bullet
class_name bullet_debuff

@export var debuff:PackedScene
@export var debuff_time:float

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _on_area_entered(body):
	#print_debug(body)
	if body.is_in_group("Enemy"):
		var target:Enemy = body.get_parent()
		print_debug(target)
		var d:Debuff = debuff.instantiate()
		print_debug(d)
		target.add_child(d)
		d.timer.wait_time = debuff_time
		d.timer.start()
		print_debug(target.get_children())
		target.take_damage(damage)
		hit()
