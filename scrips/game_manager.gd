extends Node

var score = 0

@onready var score_label = $ScoreLabel
@onready var mult_target_cam = %MultTargetCam
@onready var player1 = %player1
@onready var player2 = %player2

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins."
	
func _ready():
	mult_target_cam.add_target(player1)
	mult_target_cam.add_target(player2)
	
