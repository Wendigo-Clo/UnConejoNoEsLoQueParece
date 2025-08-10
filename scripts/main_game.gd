extends Node2D


#@export var playerPack : PackedScene
@export var fade : PackedScene
#@export var ParalaxBgPack : PackedScene
#@export var SpawnPack : PackedScene
@export var deathPack : PackedScene
@export var enemyPack : PackedScene


func _ready() -> void:
	
	


	await  get_tree().create_timer(2).timeout
	var enemyFloor = enemyPack.instantiate()
	enemyFloor.global_position = Vector2(954,1800)
	add_child(enemyFloor)
	pass


func _process(delta: float) -> void:
	if(!Global.sigueVivo):
		var escenaMuerte = deathPack.instantiate()
		add_child(escenaMuerte)


func _on_timer_timeout() -> void:
	if (Global.sigueVivo):
		var fadeFinal = fade.instantiate()
		add_child(fadeFinal)
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
	
	pass # Replace with function body.
