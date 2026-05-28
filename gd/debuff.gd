class_name Debuff
extends Node2D
var enemy:Enemy
var debuff_time:float
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = debuff_time
	enemy = self.get_parent()
	timer.start()
	#print_debug(enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	#print_debug("acabei")
	queue_free()
