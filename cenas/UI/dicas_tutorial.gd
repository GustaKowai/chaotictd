extends PanelContainer
@onready var texto: RichTextLabel = $RichTextLabel
@onready var timer: Timer = $RichTextLabel/Timer
@export_multiline() var tutorial:Array[String]
@export var menu_torres:PanelContainer
@export var botao_auto:CheckButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ativa_tutorial()
	
func show_message(wave):
	match wave:
		0:
			choose_tutorial(0)
			blink(menu_torres)
		2:
			choose_tutorial(1)
		5: 
			choose_tutorial(2)
		9:
			choose_tutorial(3)
		3:
			choose_tutorial(4)
			blink(botao_auto)
func hide_tutorial():
	hide()

func choose_tutorial(num):
	show()
	texto.text = tutorial[num]
	timer.start()


func _on_timer_timeout() -> void:
	hide_tutorial()


func _on_button_pressed() -> void:
	timer.stop()
	hide_tutorial()

func blink(UI):
	print_debug("tentei piscar")
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUINT)
	tween.set_loops(5)
	tween.tween_property(UI,"modulate",Color(2.313, 2.313, 2.313, 1.0),1)
	tween.tween_property(UI,"modulate",Color.WHITE,1)
	
func desativa_tutorial():
	WaveManager.start_wave.disconnect(show_message)

func ativa_tutorial():
	WaveManager.start_wave.connect(show_message)
