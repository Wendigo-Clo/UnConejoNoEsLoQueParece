extends Node2D

@export var plataform : PackedScene
@export var plataformSpike : PackedScene

@export var distancia_spawn = 80  # Distancia vertical mínima entre plataformas

var viewport = null
var positionSpawn = null
var valorRandom = null

var last_spawn_y = INF
var ultima_x = -INF
var distancia_minima_x = 50  # píxeles que como mínimo deben separarse en X

var porcentaje_picos = 20
var margen_spawn = 100

var ultimoFue = null

func _ready() -> void:
	last_spawn_y = get_viewport().get_camera_2d().global_position.y /2
	ultimoFue = plataform
	spawnear()

func spawnear():
	var cam_pos = get_viewport().get_camera_2d().global_position
	viewport = get_viewport_rect()
	
	if last_spawn_y > cam_pos.y:
		return

	valorRandom = randf_range(0, viewport.size.x)
	while abs(valorRandom - ultima_x) < distancia_minima_x:
		valorRandom = randf_range(0, viewport.size.x)
		
	positionSpawn = Vector2(valorRandom, cam_pos.y - viewport.size.y/2 -50)
	var escena_a_instanciar = plataform
	if randi() % 100 < porcentaje_picos and ultimoFue != plataformSpike:
		escena_a_instanciar = plataformSpike
	ultimoFue = escena_a_instanciar
	var plataforma = escena_a_instanciar.instantiate()
	plataforma.position = positionSpawn
	add_child(plataforma)
	ultima_x = valorRandom
	last_spawn_y = positionSpawn.y
	


func _on_timer_timeout() -> void:
	if(Global.sigueVivo):
		spawnear()
	pass # Replace with function body.
