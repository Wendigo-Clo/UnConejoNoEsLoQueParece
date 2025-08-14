extends CanvasLayer


func _ready() -> void:
	Telon.abrir()
	#$AnimationPlayer.play("Cortinas")
	await get_tree().create_timer(1.2).timeout
	$AnimationPlayer.play("Creditos")
	await get_tree().create_timer(7.8).timeout
	$AnimationPlayer.play("fade")


func _on_rein_pressed() -> void: #REINTENTAR
	Global.sigueVivo = true
	$iu_buttons.play()
	await get_tree().create_timer(1.2).timeout
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
	queue_free()
	pass # Replace with function body.


func _on_salir_pressed() -> void: #SALIR 
	$VBoxContainer/Salir/AudioStreamPlayer2D2.play()
	await get_tree().create_timer(0.4).timeout
	Telon.cerrar()
	get_tree().quit()
	pass # Replace with function body.
