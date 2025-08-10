extends Node2D


@export var speed: float = 150.0  # velocidad hacia abajo

func _process(delta):
	position.y += speed * delta



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	destroy()
	pass # Replace with function body.


func destroy():
	await get_tree().create_timer(2.5).timeout
	queue_free()
	
