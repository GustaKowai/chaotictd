extends Enemy
@onready var area_ataque: Area2D = %AreaAtaque


func _on_area_ataque_body_entered(alvo_morte):
	if alvo_morte.is_in_group("torre"):
		alvo_morte.die()
		
func _process(_delta: float) -> void:
	#hit_box.transform = sprite.transform
	pass
