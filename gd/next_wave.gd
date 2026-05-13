extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	WaveManager.wave_end.connect(enable_button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	WaveManager.wave += 1
	WaveManager.start_wave.emit(WaveManager.wave)
	self.disabled = true
	
func enable_button():
	self.disabled = false
