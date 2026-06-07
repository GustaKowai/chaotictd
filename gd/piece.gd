extends Area2D
@export var sprites:Array[Texture2D]

@export var piece_value:int = 5

@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_over.connect(queue_free)
	sprite_2d.texture = sprites[randi_range(0,sprites.size()-1)]
	sprite_2d.rotation = randf_range(0,360)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sprite_2d.rotate(delta)


func _on_mouse_entered() -> void:
	GameManager.piece_count += piece_value
	GameManager.piece_collected.emit()
	queue_free()
