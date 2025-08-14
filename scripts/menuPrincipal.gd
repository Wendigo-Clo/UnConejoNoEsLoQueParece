extends Control

func _ready() -> void:
	#connect("estoy", Callable(self, "_on_boton_jugar"))
	Telon.abrir()


#
#func animar_boton():
	#var tween = get_tree().create_tween()
	## Animar la variable 'progress' del shader desde 1 a 0 en 2 segundos
	#tween.tween_property($VBoxContainer/jugar.material, "shader_param/Progress", 1.0, 2.0)
#
	#print("$Boton.material -> ",$VBoxContainer/jugar.material)
	#print("is ShaderMaterial? -> ", $VBoxContainer/jugar.material is ShaderMaterial)
	## Mover el sombrero de izquierda a derecha
	## Partimos desde la izquierda del botón, hacia el borde derecho
	#var pos_inicial = $VBoxContainer/jugar/Sombrero.position
	#var pos_final = Vector2($VBoxContainer/jugar.size.x, pos_inicial.y)
	#tween.tween_property($VBoxContainer/jugar/Sombrero, "position", pos_final, 2.0)

func _on_salir_pressed() -> void:
	$VBoxContainer/Jugar/AudioStreamPlayer2D2.play()
	$AnimationPlayer.play("ApretarBoton")
	await get_tree().create_timer(0.6).timeout
	get_tree().quit()
	pass # Replace with function body.



func _on_jugar_pressed() -> void:
	$VBoxContainer/Jugar/AudioStreamPlayer2D.play()
	$AnimationPlayer.play("ApretarBoton")
	await get_tree().create_timer(1).timeout
	Telon.cerrar()
	await get_tree().create_timer(1.19).timeout
	#$VBoxContainer/jugar/AudioStreamPlayer2D.stop()
	$AudioStreamPlayer2D.stop()
	get_tree().change_scene_to_file("res://scenes/cinematico.tscn")
	pass # Replace with function body.
