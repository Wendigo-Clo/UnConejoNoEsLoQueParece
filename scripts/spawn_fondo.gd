extends Node2D

var viewport = null


var positionSpawn = null
var valorRandom = null

var ultima_x = -INF
var distancia_minima_x = 50  # píxeles que como mínimo deben separarse en X



func _ready() -> void:
	spawnear()

func spawnear():
	var cam_pos = get_viewport().get_camera_2d().global_position
	viewport = get_viewport_rect()
	
	if($Sprite2D.texture != null and Global.sigueVivo):
		valorRandom = randf_range(0, viewport.size.x)
		while abs(valorRandom - ultima_x) < distancia_minima_x:
			valorRandom = randf_range(0, viewport.size.x)
			
		positionSpawn = Vector2(valorRandom, cam_pos.y - viewport.size.y/2 -50)
		
		#plataforma.position = positionSpawn
		#add_child(plataforma)
	
	ultima_x = valorRandom
	




func _on_timer_timeout() -> void:
	if(Global.sigueVivo):
		spawnear()
	pass # Replace with function body.
