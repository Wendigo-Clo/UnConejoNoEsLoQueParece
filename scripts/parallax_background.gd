extends ParallaxBackground

var player_node

@export var player :NodePath

func _ready():
	#$player_node = get_tree().root.get_node("Main_game/player") # ruta completa
	pass

func _process(delta):
	if (is_instance_valid(player)):
		var player_node = get_node(player)
		$ParallaxBackground.scroll_offset.y = -player_node.global_position.y * 0.5
