extends CheckButton
var auto_wave:bool = false
@onready var animated_button: AnimatedSprite2D = $animated_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_button.visible = false
	WaveManager.wave_end.connect(start_wave)
	GameManager.game_over.connect(func():button_pressed = false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_toggled(toggled_on: bool) -> void:
	auto_wave = toggled_on
	animated_button.visible = toggled_on

func start_wave():
	if auto_wave:
		WaveManager.wave += 1
		WaveManager.start_wave.emit(WaveManager.wave)
