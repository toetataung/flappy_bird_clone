extends Node

onready var obstacle = preload("res://world/obstacle/obstacle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.

func obstacle_spawn():
	var Obastacle = obstacle.instance()
	add_child(Obastacle)
	Obastacle.position.y = rand_range(150,400)

func timer(value):
	if value :
		$Timer.start()
	else:
		$Timer.stop()


func _on_Timer_timeout():
	obstacle_spawn()
	pass # Replace with function body.
