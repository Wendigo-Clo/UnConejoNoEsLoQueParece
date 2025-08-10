extends Node2D

@export var detail_scene: PackedScene
@export var spawn_interval: float = 3.0

var viewport

func _ready():
	viewport = get_viewport_rect()
	var timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.timeout.connect(_spawn_detail)
	add_child(timer)

func _spawn_detail():
	var cam_pos = get_viewport().get_camera_2d().global_position
	var eye = detail_scene.instantiate()
	
	var spawn_y = cam_pos.y - viewport.size.y / 2 - 100
	var spawn_x = randf_range(0, viewport.size.x)
	# Posición inicial arriba de la pantalla, en un punto aleatorio de X
	eye.position = Vector2(spawn_x, spawn_y)
	add_child(eye)
