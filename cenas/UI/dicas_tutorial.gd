extends RichTextLabel
@onready var timer: Timer = $Timer
@export_multiline() var tutorial:Array[String]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	WaveManager.start_wave.connect(show_message)
	
func show_message(wave):
	match wave:
		0:
			choose_tutorial(0)
		2:
			choose_tutorial(1)
		5: 
			choose_tutorial(2)
		9:
			choose_tutorial(3)
func hide_tutorial():
	get_parent().hide()

func choose_tutorial(int):
	get_parent().show()
	text = tutorial[int]
	timer.start()


func _on_timer_timeout() -> void:
	hide_tutorial()


func _on_button_pressed() -> void:
	timer.stop()
	hide_tutorial()
