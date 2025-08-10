extends Control


func _on_jugar_pressed() -> void:
	$AnimationPlayer.play("cortinas")
	await get_tree().create_timer(1.19).timeout
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")
	$VBoxContainer/jugar/AudioStreamPlayer2D.play()
	pass # Replace with function body.


func _on_salir_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
