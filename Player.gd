extends KinematicBody2D


const GRAVITY = 200

var motion = Vector2.ZERO

func _physics_process(delta):
	motion.y += GRAVITY * delta
	motion = move_and_slide(motion, Vector2.UP)
