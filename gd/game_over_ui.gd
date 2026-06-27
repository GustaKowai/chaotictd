class_name GameOverUI
extends CanvasLayer

@onready var nomeJogador: LineEdit = %NomeJogador
@onready var recordeWaves: VBoxContainer = %RecordeWaves
@onready var popup_recorde: AcceptDialog = $PopupRecorde
@onready var waves_number: Label = %wavesNumber
var waves
var pontuacao_waves:Array
var recorde_waves:bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.game_over.connect(show)
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	hide()
	GameManager.restart()


func _on_visibility_changed() -> void:
	if visible:
		waves_number.text = str(WaveManager.wave)
		SaveLoadArcade.load_arcade()
		pontuacao_waves = GameManager.pontuacao_waves
		check_for_record()
	
		if (recorde_waves):
			print_debug(recorde_waves)
			popup_recorde.visible = true
		escrever_recordes()
	
func check_for_record():
	if pontuacao_waves.size() <10:
		recorde_waves = true
	else:
		var menor_pontuacao_waves:Array = pontuacao_waves[9]
		if WaveManager.wave > menor_pontuacao_waves[1]:
			recorde_waves = true

func escrever_recordes():
	for n in recordeWaves.get_children():
		recordeWaves.remove_child(n)
		n.queue_free()
	for player in pontuacao_waves:
		var name_label = Label.new()
		name_label.text = player[0]+" "+str(player[1])+" waves"
		name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		recordeWaves.add_child(name_label)

func sort_pontuacao(a,b):
	if a[1] > b[1]:
		return true
	return false


func _on_popup_recorde_confirmed() -> void:
	if recorde_waves:
		var pontuacao_player:Array
		pontuacao_player.append(nomeJogador.get_text())
		pontuacao_player.append(WaveManager.wave)
		pontuacao_waves.append(pontuacao_player)
		pontuacao_waves.sort_custom(sort_pontuacao)
		if pontuacao_waves.size() > 10:
			pontuacao_waves.pop_back()
	GameManager.pontuacao_waves = pontuacao_waves
	SaveLoadArcade.save_arcade()
	escrever_recordes()
