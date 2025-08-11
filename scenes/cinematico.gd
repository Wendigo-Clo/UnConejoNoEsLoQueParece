extends VideoStreamPlayer

func _ready() -> void:
	#Telon.abrir()
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("fade")
	$".".play()

func _input(_event: InputEvent) -> void:
	if(Input.is_key_pressed(KEY_SPACE)):
		$".".paused
		Telon.cerrar()
		await get_tree().create_timer(1.2).timeout
		get_tree().change_scene_to_file("res://scenes/main_game.tscn")

func _on_finished() -> void:
	$AnimationPlayer.play("cerrarCortinas")
	await get_tree().create_timer(1.2).timeout
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")
	pass # Replace with function body.
