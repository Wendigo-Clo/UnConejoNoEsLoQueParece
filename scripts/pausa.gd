extends CanvasLayer



func _physics_process(delta: float) -> void:
	if (Input.is_action_just_pressed("pausa")):
		get_tree().paused = not get_tree().paused
		$ColorRect.visible = not $ColorRect.visible


func _on_rein_pressed() -> void: #REINTENTAR
	Global.sigueVivo = true
	queue_free()
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_salir_pressed() -> void: #SALIR 	
	get_tree().quit()
	pass # Replace with function body.
