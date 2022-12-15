extends Node



func _ready():
	$character.connect("die", self, "game_over")
	$character.connect("score", self, "score")
	pass 
func _physics_process(delta):
	start_game()
	pass
	
func start_game():
	if Input.is_action_just_pressed("flap") && !Gamestate.game_start:
		Gamestate.game_start = true
		$obstacle_spawner.timer(true)
		$message/start_game.visible = false
	pass

func game_over():
	get_tree().call_group("obstacle","set_physics_process",false)
	$obstacle_spawner.timer(false)
	$Ground/AnimationPlayer.stop()
	$hud.visible = false
	$message.score()
	pass

func score():
	Gamestate.score += 1
	$hud/score.text = str(Gamestate.score)
	$point.play()
