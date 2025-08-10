extends Node2D

@export var speed : float = 70.0  # Velocidad de subida
var player : Node2D

func _ready():
	player = get_parent().get_node("player") # Ajustá el path al player

func _physics_process(delta):
	position.y -= speed * delta
	
	# Si la lava está a la altura del jugador, lo mata
	#if position.y < player.position.y + 10:
		#player.die()
