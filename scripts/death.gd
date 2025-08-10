extends CanvasLayer

func _ready() -> void:
	$ColorRect/AnimationPlayer.play("cortinas")
	$ColorRect.visible = not $ColorRect.visible
	get_tree().paused = not get_tree().paused


func _on_muertePlayer():
		get_tree().paused = not get_tree().paused
		$ColorRect.visible = not $ColorRect.visible

func _on_rein_pressed() -> void: #REINTENTAR
	get_tree().paused = not get_tree().paused
	$ColorRect.visible = not $ColorRect.visible
	Global.sigueVivo = true
	get_tree().reload_current_scene()
	queue_free()
	pass # Replace with function body.


func _on_salir_pressed() -> void: #SALIR 	
	get_tree().quit()
	pass # Replace with function body.
