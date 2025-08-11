extends Node

var fade_scene = preload("res://scenes/telon.tscn")

func play_fade_in():
	var fade = fade_scene.instantiate()
	get_tree().current_scene.add_child(fade)
	connect("termino", _termino_animacion)
	
	fade.abrir()

func _termino_animacion():
	get_child(1).queue_free()

	
func play_fade_out():
	var fade = fade_scene.instantiate()
	get_tree().current_scene.add_child(fade)
	connect("termino", _termino_animacion)
	fade.cerrar()
