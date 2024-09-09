extends Area2D


@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer


func _on_body_entered(body):
	animation_player.play("pickup")
	playerVariables.score += 1
	
	pass # Replace with function body.

