extends bullet_bumerangue

func damage_enemy(body):
	var target:Enemy = body.get_parent()
	if target.current_health <= target.max_health*0.3:
		target.die()
	else:
		super(body)


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
