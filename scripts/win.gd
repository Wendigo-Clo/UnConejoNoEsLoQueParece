extends CanvasLayer


func _ready() -> void:
	$AnimationPlayer.play("Cortinas")
	#$TextureRect.visible = true

	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("fade")




func _on_rein_pressed() -> void: #REINTENTAR
	Global.sigueVivo = true
	await get_tree().create_timer(1.2).timeout
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
	queue_free()
	pass # Replace with function body.


func _on_salir_pressed() -> void: #SALIR 
	Telon.abrir()
	await get_tree().create_timer(1.2).timeout
	get_tree().quit()
	pass # Replace with function body.
