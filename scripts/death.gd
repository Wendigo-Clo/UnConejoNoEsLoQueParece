extends CanvasLayer

func _ready() -> void:
	Telon.cerrar()
	get_tree().paused = not get_tree().paused
	$ColorRect.visible = true


func _on_muertePlayer():
		get_tree().paused = not get_tree().paused

func _on_rein_pressed() -> void: #REINTENTAR
	get_tree().paused = not get_tree().paused
	Global.sigueVivo = true
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")
	pass # Replace with function body.


func _on_salir_pressed() -> void: #SALIR 
	Telon.fade_out()
	await get_tree().create_timer(1.2).timeout
	get_tree().quit()
	pass # Replace with function body.
