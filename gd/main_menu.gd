extends Control

func _ready():
	$VBoxContainer/StartGame.pressed.connect(_on_start_game_pressed)
	$VBoxContainer/Options.pressed.connect(_on_options_pressed)
	$VBoxContainer/Scoreboard.pressed.connect(_on_scoreboard_pressed)
	$VBoxContainer/ExitGame.pressed.connect(_on_exit_game_pressed)

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://cenas/main.tscn")

func _on_options_pressed():
	pass

func _on_scoreboard_pressed():
	get_tree().change_scene_to_file("res://cenas/UI/leaderboard.tscn")
	#print_debug(get_tree().change_scene_to_packed(leaderboard))
	pass
func _on_exit_game_pressed():
	get_tree().quit()
