extends VideoStreamPlayer

var telon = null
func _ready() -> void:
	telon = Telon
	telon.abrir()
	await get_tree().create_timer(1).timeout
	
	$".".play()
	$AnimationPlayer.play("fade")


func _input(event: InputEvent) -> void:
	if(Input.is_key_pressed(KEY_SPACE)):
		$".".paused
		$ColorRect.visible = true
		$AnimationPlayer.play("fade_out")
		Telon.cerrar()
		await get_tree().create_timer(0.6).timeout
		_on_finished()

func _on_finished() -> void:
	telon.fade_out()
	await get_tree().create_timer(.6).timeout
	$ColorRect.visible = true
	await get_tree().create_timer(.6).timeout
	
	get_tree().change_scene_to_file("res://scenes/winTotal.tscn")
	pass # Replace with function body.
