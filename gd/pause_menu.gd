extends Control

@onready var round_label: Label = $VBoxContainer/InfoContainer/WaveContainer/RoundLabel
@onready var money_label: Label = $VBoxContainer/InfoContainer/MoneyContainer/MoneyLabel
@onready var resume_button: TextureButton = $VBoxContainer/Resume
@onready var quit_button: TextureButton = $VBoxContainer/QuitToMainMenu

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false

	resume_button.pressed.connect(_on_resume_pressed)
	quit_button.pressed.connect(_on_quit_to_main_menu_pressed)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	if visible:
		resume_game()
	else:
		pause_game()

func pause_game():
	visible = true
	get_tree().paused = true

	round_label.text = str(WaveManager.wave)
	money_label.text = str(GameManager.piece_count)

func resume_game():
	visible = false
	get_tree().paused = false

func _on_resume_pressed():
	resume_game()

func _on_quit_to_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://cenas/UI/main_menu.tscn")


func _on_check_button_toggled(toggled_on: bool) -> void:
	GameManager.tutorial_on.emit(toggled_on)
