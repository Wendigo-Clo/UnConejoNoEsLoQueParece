extends Button

signal estoy

func _on_pressed() -> void:
	$AnimationPlayer.play("out")
	await get_tree().create_timer(.5).timeout
	emit_signal("estoy")
	pass # Replace with function body.
