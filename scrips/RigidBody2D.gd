extends Node2D
@onready var player1 = %player1
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass # Replace with function body.



func _on_area_2d_body_entered(body):
	if body.is_in_group("players"):
		animation_player.play("unfreeze") 
		print("help i'm falling")
	pass # Replace with function body.
