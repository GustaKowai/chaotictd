extends Building
@onready var area_dano: Area2D = $area_dano
@onready var timer: Timer = $area_dano/Timer

func upgrade_1_1():
	area_dano.dano_area = 50
	
func upgrade_2_1():
	area_dano.scale = Vector2(1.5,1.5)
	
func upgrade_2_2():
	area_dano.set_collision_mask_value(6,true)

func upgrade_2_3():
	area_dano.retira_cammo = true

func upgrade_3_1():
	timer.wait_time = 0.5
