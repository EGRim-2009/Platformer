extends Area2D

@onready var timer = $Timer
@onready var mult_target_cam = %MultTargetCam
@onready var player1 = %player1
@onready var player2 = %player2
@export var lives = 3


func _on_body_entered(body):
	print("You got damaged")
	playerVariables.damage = true
	playerVariables.lives = playerVariables.lives-1
	print(playerVariables.lives)
	
	if body.position.y > -10:
		playerVariables.lives = 0
	if playerVariables.lives == 0:
		playerVariables.score =0
		print("You died")
		print(playerVariables.lives)
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()	
		timer.start()
		pass # Replace with function body.


func _on_timer_timeout():
	Engine.time_scale = 1
	playerVariables.lives = 3
	get_tree().reload_current_scene()
	pass # Replace with function body.
