extends State
class_name  EnemyFollow

@export var enemy: Enemy
@export var move_speed:float = 30.0

var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func Exit():
	pass
	
func Update(_delta: float):
	pass
	
func Physics_update(_delta: float):
	var direction = player.global_position - enemy.global_position
	print_debug(direction.length())
	
	if direction.length() > 25:
		enemy.velocity = direction.normalized()*move_speed
	else:
		enemy.velocity = Vector2()
	if direction.length() > 500:
		Transitioned.emit(self,"idle")
