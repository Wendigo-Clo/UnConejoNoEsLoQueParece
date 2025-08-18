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

var puedoMoverme = true
#var estado = ["idle", "walk", "jump"]  # idle, walk, jump

#tiempo verificador
var tiempoLimite : float = 0.2
var cronometro : float = 0

var max_jumps := 2  # cantidad máxima de saltos (doble salto = 2)
var jumps_left := max_jumps

var telon = null

func _ready() -> void:
	anim_tree.active = true
	telon = Telon
	pass
	
	
	
func _physics_process(delta: float) -> void:
	if(puedoMoverme):
		var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		if input.length() > 0:
			velocity.x = input.x * speed
			$Sprite2D.flip_h = input.x < 0
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
				

		grounded = $GoundRay.is_colliding() or is_on_floor()
		if not grounded:
			if velocity.y <= 0:
				cronometro =0
				velocity.y += gravity_up * delta
				state_machine.travel("jump")
			elif(velocity.y > 0):
				cronometro +=delta
				velocity.y += gravity_down *delta 
				if(cronometro >= tiempoLimite): 
					state_machine.travel("fall")
				else:
					state_machine.travel("RESET")
		else:
			velocity.y = 0
			jumps_left = max_jumps
			if input.length() > 0:
				state_machine.travel("walk")
				#$AnimationPlayer.play("walk")
			else:
				#cronometro = 0
				state_machine.travel("RESET")
				#cronometro += delta
				#if(cronometro >= tiempoLimite):
				#	state_machine.travel("RESET")
				#	cronometro = 0
				#$AnimationPlayer.play("RESET")
			
		if Input.is_action_just_pressed("ui_accept") and jumps_left > 0:
			velocity.y = jumpForce
			$ConejoJump.play()
			jumps_left -= 1

		move_and_slide()

func die():
	position = Vector2(997.0,540)
	Global.sigueVivo = false
	Global.playerDeath()


func gane():
	$CollisionShape2D.queue_free()
	$Area2D.queue_free()
	position = Vector2(997,540)
	puedoMoverme = false
	telon.fada_fantasy()
	await get_tree().create_timer(0.6).timeout
	
#
func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("enemy")):
		if(body.is_in_group("snake")):
			$snake.play()
			await get_tree().create_timer(1.1).timeout
		else:
			$dieSound.play()
			await get_tree().create_timer(.3).timeout
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
