extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if playerVariables.damage == true:
		animated_sprite.play("damaged")
		await animated_sprite.animation_finished
		playerVariables.damage = false
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("p1jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	

	#Get the input direction: -1, 0, 1
	var direction = Input.get_axis("p1left", "p1right")
	if direction>0:
		animated_sprite.flip_h = false
	elif direction<0:
		animated_sprite.flip_h = true
		
	# Play animations
	if is_on_floor():
			if Input.is_action_pressed("p1crouch"):
				animated_sprite.play("crouch")
			elif direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
	else:
			animated_sprite.play("jump")
		
	if Input.is_action_pressed("p1crouch") and Input.is_action_just_pressed("p1jump") :
		velocity.y = JUMP_VELOCITY -50
		pass
		
	#apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
