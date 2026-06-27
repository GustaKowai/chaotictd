extends Area2D
@export var shield_value:int
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
var torres:Array
@onready var area_escudo_sprite: AnimatedSprite2D = $"../AreaEscudoSprite"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	WaveManager.start_wave.connect(criar_escudo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func criar_escudo(_wave):
	area_escudo_sprite.visible = true
	area_escudo_sprite.play("default")
	global_position.x += 1 #Precisa disso pq se não ele não atualiza a lista de overlapping_bodies
	global_position.x -= 1
	await get_tree().physics_frame
	#global_position.x -= 1
	animated_sprite_2d.play("smile")
	#print_debug("tentou criar escudo")
	#torres = get_overlapping_bodies()
	#print_debug(torres)
	#var teste = get_parent().get_parent().get_children()
	#print_debug(teste)
	#for subject in teste:
		#if subject.is_in_group("torre"):
			#print_debug(global_position.distance_to(subject.global_position))
			#if global_position.distance_to(subject.global_position) < 250:
				#subject.set_shield(shield_value)
		
	for torre in torres:
		if torre.is_in_group("torre"):
			torre.set_shield(shield_value)

#
func _on_body_entered(body: Node2D) -> void:
	#print_debug(body, " entrou")
	if body.is_in_group("torre"):
		torres.append(body)
		criar_escudo(1)

func _on_body_exited(body: Node2D) -> void:
	#print_debug(body," saiu")
	torres.erase(body)


func _on_area_escudo_sprite_animation_finished() -> void:
	area_escudo_sprite.visible = false


func adicionar_escudo(_wave):
	area_escudo_sprite.visible = true
	area_escudo_sprite.play("default")
	global_position.x += 1 #Precisa disso pq se não ele não atualiza a lista de overlapping_bodies
	global_position.x -= 1
	await get_tree().physics_frame
	#global_position.x -= 1
	animated_sprite_2d.play("smile")
	for torre in torres:
		if torre.is_in_group("torre"):
			torre.add_shield(shield_value)
			
func cura_torre(_wave):
	#area_escudo_sprite.visible = true
	#area_escudo_sprite.play("default")
	global_position.x += 1 #Precisa disso pq se não ele não atualiza a lista de overlapping_bodies
	global_position.x -= 1
	await get_tree().physics_frame
	#global_position.x -= 1
	#animated_sprite_2d.play("smile")
	for torre in torres:
		if torre.is_in_group("torre"):
			torre.heal_damage(50)
