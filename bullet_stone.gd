extends bullet_debuff

		
func apply_debuff(target):
	var d:Debuff = debuff.instantiate()
	d.debuff_time = debuff_time
	var children = target.get_children()
	for child in children:
		if child.name == "HitBox":
			print_debug(child.get_child(0).shape.radius)
			d.raio = child.get_child(0).shape.radius+50
	target.add_child.call_deferred(d)
