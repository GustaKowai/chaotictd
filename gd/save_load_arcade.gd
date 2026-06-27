extends Node

var save_arcade_path = "user://arcade.cfg"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func save_arcade():
	var config = ConfigFile.new()
	config.set_value("recorde","waves",GameManager.pontuacao_waves)
	config.save(save_arcade_path)
	print_debug("Salvei")
func load_arcade():
	var config = ConfigFile.new()
	var err = config.load(save_arcade_path)
	# If the file didn't load, ignore it.
	if err != OK:
		print_debug("Error")
		return
	for type in config.get_sections():
		GameManager.pontuacao_waves = config.get_value(type,"waves")
		print_debug("Carreguei",WaveManager.wave,config.get_value(type,"waves"))
