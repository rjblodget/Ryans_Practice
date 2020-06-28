extends KinematicBody2D


const GRAVITY = 2
const MAX_SPEED = 400

var velocity = Vector2.ZERO


func get_input():
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	return input_vector

func _physics_process(delta):
	var input_vector = get_input()	
	# gravity_velocity.y += GRAVITY
	velocity = input_vector
	var tmp_vel = move_and_collide(velocity * delta * MAX_SPEED)

