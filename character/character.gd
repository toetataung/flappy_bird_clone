extends RigidBody2D
class_name chracter
onready var animator = $AnimationPlayer
const FLAP_FORCE = -250
signal die
signal score

func _ready():
	pass

func _physics_process(delta):
	if Gamestate.game_start && Gamestate.alive:
		angular_velocity_calculator()
		flap()
	pass

func flap():
	gravity_scale = 10.0
	if Input.is_action_just_pressed("flap") && Gamestate.alive:
		animator.play("flap")
		$flap.play()
		linear_velocity.y = FLAP_FORCE

func angular_velocity_calculator():
	if linear_velocity.y < 0:
		angular_velocity = -5
		if rotation_degrees <= -20:
			angular_velocity = 0
	else:
		angular_velocity = 1
	pass 

func die():
	emit_signal("die")
	$die.play()
	Gamestate.alive = false
	animator.stop()
	get_tree().call_group("chracter","set_physics_process",false)
	pass

func score():
	emit_signal("score")
	pass
