extends Bullet_slow
class_name bullet_debuff

@export var debuff:PackedScene
@export var debuff_time:float

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _on_area_entered(body):
	#print_debug(body)
	if body.is_in_group("Enemy"):
		var target:Enemy = body.get_parent()
		apply_debuff(target)
	super(body)
	
	
func apply_debuff(target):
	var d:Debuff = debuff.instantiate()
	d.debuff_time = debuff_time
	target.add_child(d)
