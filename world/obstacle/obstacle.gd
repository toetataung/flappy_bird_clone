extends Node2D

var ObstacleMovingSpeed = -3

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position.x += ObstacleMovingSpeed
	if global_position.x < -50:
		queue_free()


func _on_pipe_body_entered(body):
	if body is chracter:
		if body.has_method("die"):
			body.die()
	pass # Replace with function body.


func _on_score_area_body_exited(body):
	if body is chracter:
		if body.has_method("score"):
			body.score()
	pass # Replace with function body.
