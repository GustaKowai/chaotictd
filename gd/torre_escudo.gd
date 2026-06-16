extends Building
@onready var area_escudo: Area2D = $AreaEscudo

func upgrade_1_1():
	area_escudo.shield_value = 400
	
func upgrade_2_1():
	area_escudo.scale = Vector2(1.5,1.5)
