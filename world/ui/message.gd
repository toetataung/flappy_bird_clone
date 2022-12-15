extends Control

func _ready():
	pass # Replace with function body.

func score():
	$game_over.visible = true
	$game_over/VBoxContainer/score.text = "Score: " +  str(Gamestate.score)


func _on_restart_pressed():
	get_tree().reload_current_scene()
	Gamestate.alive = true
	Gamestate.game_start = false
	Gamestate.score = 0
	pass # Replace with function body.
