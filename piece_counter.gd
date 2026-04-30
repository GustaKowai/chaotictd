extends HBoxContainer
@onready var piece_number: Label = %Piece_number


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.piece_collected.connect(update)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update():
	piece_number.text = str(GameManager.piece_count)
