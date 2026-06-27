extends bullet_bumerangue

func damage_enemy(body):
	if body.is_in_group("Enemy"):
		body.print_tree_pretty()
		print_debug(body.get_parent())
		var target:Enemy = body.get_parent()
		if target.current_health <= target.max_health*0.3:
			target.die()
		else:
			super(body)


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
