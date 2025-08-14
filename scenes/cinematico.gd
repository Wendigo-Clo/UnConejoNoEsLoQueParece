extends VideoStreamPlayer

func _ready() -> void:
	#$AudioStreamPlayer2D.play()
	Telon.abrir()
	await get_tree().create_timer(1).timeout
	$".".play()
	#await get_tree().create_timer(.5).timeout
	$AnimationPlayer.play("fade")

func _input(_event: InputEvent) -> void:
	if(Input.is_key_pressed(KEY_SPACE)):
		$".".paused
		_on_finished()


func _on_finished() -> void:
	$AnimationPlayer.play("fade_out")
	await get_tree().create_timer(0.7).timeout
	$AnimationPlayer.play("cerrarCortinas")
	await get_tree().create_timer(1.2).timeout
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")
	pass # Replace with function body.
