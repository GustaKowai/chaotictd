extends Building
@onready var area_dano: Area2D = $area_dano
@onready var timer: Timer = $area_dano/Timer
@export var bomba:PackedScene
@export var spread_area_radius:float
var count_to_bomb:int

func upgrade_1_1():
	area_dano.dano_area = 50
	
func upgrade_1_3():
	area_dano.upgrade_money = true
	
func upgrade_2_1():
	area_dano.scale = Vector2(1.5,1.5)
	
func upgrade_2_2():
	area_dano.set_collision_mask_value(6,true)

func upgrade_2_3():
	area_dano.retira_cammo = true

func upgrade_3_1():
	timer.wait_time = 0.5
	
func upgrade_3_2():
	area_dano.area_entered.connect(damage_enemy)

func upgrade_3_3():
	timer.timeout.connect(wait_bomb)
	

func drop_bomb():
	var position_spread:Vector2 = Vector2(randf_range(-1,1),randf_range(-1,1))*spread_area_radius
	var item = bomba.instantiate()
	item.position = position+position_spread
	get_parent().call_deferred("add_child",item)
	#get_parent().add_child(item)
	
func wait_bomb():
	if not WaveManager.is_wave:
		return
	if count_to_bomb >= 5:
		drop_bomb()
		count_to_bomb = 0
	else:
		count_to_bomb += 1
		
func damage_enemy(inimigo):
	#print_debug("causei dano em quem entrou")
	if inimigo.is_in_group("Enemy"):
		var inimigo_body:Enemy = inimigo.get_parent()
		inimigo_body.take_damage(2*area_dano.dano_area)
