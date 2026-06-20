extends Building
@onready var area_escudo: Area2D = $AreaEscudo
@export var mais_pecas:PackedScene
var dinheiro_por_rodada:int

func upgrade_1_1():
	area_escudo.shield_value = 400
	
func upgrade_1_3():
	WaveManager.start_wave.disconnect(area_escudo.criar_escudo)
	WaveManager.start_wave.connect(area_escudo.adicionar_escudo)
	
func upgrade_2_1():
	area_escudo.scale = Vector2(1.5,1.5)

func upgrade_3_1():
	WaveManager.start_wave.connect(da_dinheiro)
	dinheiro_por_rodada = 100
	
func upgrade_3_2():
	dinheiro_por_rodada = 300
	
func upgrade_3_3():
	dinheiro_por_rodada = 1000
	
func da_dinheiro(_wave):
	var mp = mais_pecas.instantiate()
	mp.global_position = self.global_position
	get_tree().root.get_node("Main").add_child(mp)
	mp.label.text = "+" + str(dinheiro_por_rodada)
	GameManager.piece_count += dinheiro_por_rodada
	GameManager.piece_collected.emit()
	
