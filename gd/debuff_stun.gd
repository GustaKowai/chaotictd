extends Debuff

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	#print_debug(enemy)
	enemy.stun = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print_debug(timer.time_left)
	pass


func _on_tree_exiting() -> void:
	enemy.stun = false
	pass
