class_name Player
extends CharacterBody2D

var speed = 30.0
var runningSpeed = 40.0

var playerDead = false

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionY = Input.get_axis("Arriba","Abajo")
	var directionX = Input.get_axis("Izquierda","Derecha")
	var Running = Input.is_action_pressed("Running")
	
	if directionX and not playerDead and not Running:
		velocity.x = directionX * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if directionY and not playerDead and not Running:
		velocity.y = directionY * speed
	else:
		velocity.y = move_toward(velocity.x, 0, speed)
	if Running:
		if directionX and not playerDead:
			velocity.x = directionX * runningSpeed
		else:
			velocity.x = move_toward(velocity.x, 0, runningSpeed)
		if directionY and not playerDead:
			velocity.y = directionY * runningSpeed
		else:
			velocity.y = move_toward(velocity.x, 0, runningSpeed)
	
	if playerDead and scale.x > 0.0:
		scale.x -= 0.2 * delta
		scale.y -= 0.2 * delta
	
	move_and_slide()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "LevelMap":
		playerDead = true
