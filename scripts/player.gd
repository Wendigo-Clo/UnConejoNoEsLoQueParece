extends CharacterBody2D

@onready var anim_tree = $AnimationTree
@onready var state_machine = anim_tree.get("parameters/playback")

var speed : float = 380.0
var jumpForce :float = -1200.0
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity : float = 2500
var gravity_up = 1800.0
var gravity_down = 3400.0
var isJumping = false

var grounded := false

#var estado = ["idle", "walk", "jump"]  # idle, walk, jump



var max_jumps := 2  # cantidad máxima de saltos (doble salto = 2)
var jumps_left := max_jumps

func _ready() -> void:
	anim_tree.active = true
	pass
	
	
	
func _physics_process(delta: float) -> void:
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input.length() > 0:
		velocity.x = input.x * speed
		$Sprite2D.flip_h = input.x < 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
			

	grounded = $GoundRay.is_colliding() or is_on_floor()
	if not grounded:
		#state_machine.travel("jump")
		#$AnimationPlayer.play("jump")
		if velocity.y <= 0:
			velocity.y += gravity_up * delta
			
			state_machine.travel("jump")
		elif(velocity.y > 0 and not grounded):
			velocity.y += gravity_down *delta 
			state_machine.travel("fall")
			#$AnimationPlayer.play("fall")
	else:
		velocity.y = 0
		jumps_left = max_jumps
		if input.length() > 0:
			state_machine.travel("walk")
			#$AnimationPlayer.play("walk")
		else:
			state_machine.travel("RESET")
			#$AnimationPlayer.play("RESET")
		
	if Input.is_action_just_pressed("ui_accept") and jumps_left > 0:
		velocity.y = jumpForce
		$ConejoJump.play()
		jumps_left -= 1

	# Mover y detectar suelo
	move_and_slide()

func die():
	position = Vector2(997.0,540)
	Global.sigueVivo = false
	Global.playerDeath()


func gane():
	$CollisionShape2D.disabled = true
	$Area2D.visible = false
	position = Vector2(997.0,540)
	Telon.fade_out()
	Telon.cerrar()
	#await get_tree().create_timer(.5).timeout
	get_tree().change_scene_to_file("res://scenes/cinematico_outro.tscn")
#
func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("enemy")):
		if(body.is_in_group("snake")):
			$snake.play()
			await get_tree().create_timer(.2).timeout
		else:
			$dieSound.play()
			await get_tree().create_timer(.2).timeout
		die()
	pass # Replace with function body.


func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area.is_in_group("enemy")):
		if(area.is_in_group("snake")):
			$snake.play()
			await get_tree().create_timer(.2).timeout
		else:
			$dieSound.play()
			await get_tree().create_timer(.2).timeout
		print("Has muerto!")
		die()
	pass # Replace with function body.
