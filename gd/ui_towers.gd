extends PanelContainer
@onready var button: Button = $FoldableContainer/ScrollContainer/VBoxContainer/Button
@onready var button_2: Button = $FoldableContainer/ScrollContainer/VBoxContainer/Button2
@onready var button_3: Button = $FoldableContainer/ScrollContainer/VBoxContainer/Button3
@onready var button_4: Button = $FoldableContainer/ScrollContainer/VBoxContainer/Button4
@onready var button_5: Button = $FoldableContainer/ScrollContainer/VBoxContainer/Button5
@onready var button_6: Button = $FoldableContainer/ScrollContainer/VBoxContainer/Button6


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_over.connect(game_over)
	GameManager.restart_game.connect(restart)


func game_over():
	hide()
	
func restart():
	show()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("add_tower_1"):
		button.put_tower()
	if event.is_action_pressed("add_tower_2"):
		button_2.put_tower()
	if event.is_action_pressed("add_tower_3"):
		button_3.put_tower()
	if event.is_action_pressed("add_tower_4"):
		button_4.put_tower()
	if event.is_action_pressed("add_tower_5"):
		button_5.put_tower()
	if event.is_action_pressed("add_tower_6"):
		button_6.put_tower()
	
