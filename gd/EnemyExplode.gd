extends State
class_name EnemyDie

@export var enemy: Enemy

func Enter():
	enemy.die()
