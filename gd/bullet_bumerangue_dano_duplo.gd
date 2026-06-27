extends bullet_bumerangue



func _on_area_exited(area: Area2D) -> void:
	damage_enemy(area)
	damage_enemy(area)
