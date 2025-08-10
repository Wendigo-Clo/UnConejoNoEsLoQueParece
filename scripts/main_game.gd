extends Node2D


@export var playerPack : PackedScene
@export var wallPack : PackedScene
@export var ParalaxBgPack : PackedScene
@export var SpawnPack : PackedScene
@export var deathPack : PackedScene
@export var enemyPack : PackedScene


func _ready() -> void:
	

	await  get_tree().create_timer(4).timeout
	var enemyFloor = enemyPack.instantiate()
	enemyFloor.global_position = Vector2(954,1190)
	add_child(enemyFloor)
	pass


func _process(delta: float) -> void:
	if(!Global.sigueVivo):
		var escenaMuerte = deathPack.instantiate()
		add_child(escenaMuerte)
