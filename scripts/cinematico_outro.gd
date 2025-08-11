extends VideoStreamPlayer

func _ready() -> void:

	Telon.abrir()
	await get_tree().create_timer(1).timeout
	
	$".".play()
	$AnimationPlayer.play("fade")


func _input(event: InputEvent) -> void:
	if(Input.is_key_pressed(KEY_SPACE)):
		$".".paused
		$AnimationPlayer.play("fade_out")
		Telon.cerrar()
		_on_finished()

func _on_finished() -> void:
	$ColorRect.visible = true
	await get_tree().create_timer(1.2).timeout
	
	get_tree().change_scene_to_file("res://scenes/winTotal.tscn")
	pass # Replace with function body.
