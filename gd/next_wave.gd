extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	WaveManager.wave_end.connect(enable_button)
	WaveManager.start_wave.connect(disable_button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_pressed() -> void:
	WaveManager.wave += 1
	WaveManager.start_wave.emit(WaveManager.wave)
	
func enable_button():
	self.disabled = false

func disable_button(_a):
	self.disabled = true
