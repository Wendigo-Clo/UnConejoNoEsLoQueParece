extends CanvasLayer

var cortinasSi = true

func _physics_process(delta: float) -> void:
	if (Input.is_action_just_pressed("pausa")):
		if(cortinasSi):
			$ColorRect/AnimationPlayer.play("cortinas")
		else: 
			$ColorRect/AnimationPlayer.play("adiosCortinas")
			await get_tree().create_timer(0.5).timeout
		get_tree().paused = not get_tree().paused
		$ColorRect.visible = not $ColorRect.visible
		cortinasSi = !cortinasSi


func _on_rein_pressed() -> void: #REINTENTAR
	Global.sigueVivo = true
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
	queue_free()
	pass # Replace with function body.


func _on_salir_pressed() -> void: #SALIR 	
	get_tree().quit()
	pass # Replace with function body.
