extends Node2D


#@export var playerPack : PackedScene
@export var fade : PackedScene
#@export var ParalaxBgPack : PackedScene
@export var SpawnPack : PackedScene
@export var deathPack : PackedScene
@export var enemyPack : PackedScene

var enemyFloor = null

func _ready() -> void:
	Telon.abrir()

	var spawn = SpawnPack.instantiate()
	add_child(spawn)

	await  get_tree().create_timer(2).timeout
	enemyFloor = enemyPack.instantiate()
	enemyFloor.global_position = Vector2(954,1000)
	add_child(enemyFloor)
	



func _process(_delta: float) -> void:
	if(!Global.sigueVivo):
		enemyFloor.position = Vector2(954,800)
		var escenaMuerte = deathPack.instantiate()
		add_child(escenaMuerte)



func _on_timer_timeout() -> void:
	if (Global.sigueVivo):
			$player.gane()
	#Telon.fada_fantasy()
	Telon.cerrar()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/cinematico_outro.tscn")
	pass # Replace with function body.
