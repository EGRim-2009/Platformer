extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if playerVariables.damage == true:
		playerVariables.canMove = false
		animated_sprite.play("damaged")
		playerVariables.damage = false

	if playerVariables.canMove == true:
		if not is_on_floor():
			velocity.y += gravity * delta

		# Handle jump.
		if Input.is_action_just_pressed("p2jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		#Get the input direction: -1, 0, 1
		var direction = Input.get_axis("p2left", "p2right")
		if direction>0:
			animated_sprite.flip_h = false
		elif direction<0:
			animated_sprite.flip_h = true
			
		# Play animations
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		else:
			animated_sprite.play("jump")
			
		#apply movement
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()

func _on_animated_sprite_2d_animation_finished():
	playerVariables.canMove = true
