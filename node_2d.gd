extends Node2D
@onready var timer = $Timer
@onready var player1 = %player1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_detection_area_body_entered(body):
	if body is player1:
		timer.start()
		pass
	
func _on_timer_timeout():
	Engine.time_scale = 1
	
	pass
