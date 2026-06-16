extends Enemy
@onready var area_ataque: Area2D = %AreaAtaque


func _on_area_ataque_body_entered(alvo):
	if alvo.is_in_group("torre"):
		alvo.die()
		
func _process(delta: float) -> void:
	#hit_box.transform = sprite.transform
	pass
