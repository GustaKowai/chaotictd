extends Node2D

@onready var recordeWaves: VBoxContainer = %RecordeWaves
#@export var main_menu:PackedScene
var pontuacao_waves:Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SaveLoadArcade.load_arcade()
	pontuacao_waves = GameManager.pontuacao_waves
	escrever_recordes()
	#print_debug(main_menu)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func escrever_recordes():
	for n in recordeWaves.get_children():
		recordeWaves.remove_child(n)
		n.queue_free()
	for player in pontuacao_waves:
		var name_label = Label.new()
		name_label.text = player[0]+" "+str(player[1])+" waves"
		name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		recordeWaves.add_child(name_label)


func _on_button_pressed() -> void:
		get_tree().change_scene_to_file("res://cenas/UI/main_menu.tscn")
