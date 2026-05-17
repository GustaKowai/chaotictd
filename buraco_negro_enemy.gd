extends Enemy
@onready var area_ataque = $AreaAtaque


func _on_area_ataque_body_entered(alvo):
	if alvo.is_in_group("torre"):
		alvo.die()
