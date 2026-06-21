extends Debuff
@export var damage:int
@export var impact_scene:PackedScene
@onready var sprite_2d: Sprite2D = $Node2D/Sprite2D
var raio:int

func _ready() -> void:
	super()
	sprite_2d.position.x = raio

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		var target:Enemy = area.get_parent()
		#print_debug(target.slow_time, " ", target.velocity)
		target.take_damage(damage)
		hit()

func hit():
	if impact:
		var i = impact_scene.instantiate()
		i.transform = transform
		i.global_position = sprite_2d.global_position
		get_tree().root.get_node("Main").add_child(i)
