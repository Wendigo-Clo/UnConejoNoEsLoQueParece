extends Button


func _on_pressed() -> void:
	$AnimationPlayer.play("out")
	await get_tree().create_timer(.5).timeout
	get_tree().quit()
	pass # Replace with function body.
