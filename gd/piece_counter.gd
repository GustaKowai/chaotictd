extends HBoxContainer
@onready var piece_number: Label = %Piece_number
@onready var wave_number:Label = %wave_number


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.piece_collected.connect(update)
	WaveManager.start_wave.connect(update_wave)
	piece_number.text = str(GameManager.piece_count)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update():
	piece_number.text = str(GameManager.piece_count)

func update_wave(num):
	wave_number.text =str(WaveManager.wave)
