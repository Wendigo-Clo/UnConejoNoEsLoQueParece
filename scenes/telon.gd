extends Control

signal termino




func abrir():
	$AnimationPlayer.play("cerrar")
	await get_tree().create_timer(1.2).timeout
	emit_signal("termino")

	
func cerrar(): #deberia hacerlo con un tween para que busque pos camara
	$AnimationPlayer.play("abrir")
	await get_tree().create_timer(1.2).timeout
	emit_signal("termino")

func fade():
	$AnimationPlayer.play("fade")
	await get_tree().create_timer(1).timeout
	#emit_signal("termino")

func fade_out():
	$AnimationPlayer.play("fade_out")
	await get_tree().create_timer(.6).timeout
	
func fada_fantasy():
	$AnimationPlayer.play("Fantasi")
	await get_tree().create_timer(.6).timeout
	
