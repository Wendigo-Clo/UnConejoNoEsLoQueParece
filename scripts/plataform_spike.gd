extends StaticBody2D

var gravity : float = 400



func _ready() -> void:
	var posicionPlatform = self.global_position
	posicionPlatform.y = 1100
	var tween  = get_tree().create_tween()
	tween.tween_property(self,"position", posicionPlatform, 7.0)
	
	await get_tree().create_timer(1.5).timeout
	$AnimationPlayer.play("spikes")
	pass


func _physics_process(_delta):
	var cam_y = get_viewport().get_camera_2d().global_position.y
	var screen_height = get_viewport_rect().size.y
	var bottom_limit = cam_y + screen_height / 2 + 150
	
	if global_position.y > bottom_limit:
		queue_free()
