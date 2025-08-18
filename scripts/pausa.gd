extends CanvasLayer

var cortinasSi = true
var telon = null

func _ready() -> void:
	telon = Telon

func pausar():
	$ColorRect/AnimationPlayer.play("cortinas")
	get_tree().paused = not get_tree().paused


func _physics_process(_delta: float) -> void:
	if (Input.is_action_just_pressed("pausa")):
		if(cortinasSi):
			$ColorRect/AnimationPlayer.play("cortinas")
		else: 
			$ColorRect/AnimationPlayer.play("nuttons")
			await get_tree().create_timer(1).timeout
			$ColorRect/AnimationPlayer.play("adiosCortinas")
			await get_tree().create_timer(0.5).timeout
		get_tree().paused = not get_tree().paused
		$ColorRect.visible = not $ColorRect.visible
		cortinasSi = !cortinasSi




func _on_salir_pressed() -> void: #SALIR 	
	$AudioStreamPlayer2D.play()
	$ColorRect/AnimationPlayer.play("nuttons")
	await get_tree().create_timer(1).timeout
	telon.abrir()
	await get_tree().create_timer(1).timeout
	get_tree().quit()
	pass # Replace with function body.


func _on_reintentar_pressed() -> void:
	$AudioStreamPlayer2D.play()
	$ColorRect/AnimationPlayer.play("nuttons")
	await get_tree().create_timer(1).timeout
	Global.sigueVivo = true
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
	queue_free()
	pass # Replace with function body.
	pass # Replace with function body.
