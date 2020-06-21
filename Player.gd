extends KinematicBody2D


const TARGET_FPS = 60
const GRAVITY = 4

var motion = Vector2.ZERO

func _physics_process(delta):
	motion.y += GRAVITY * delta * TARGET_FPS
	motion = move_and_slide(motion, Vector2.UP)
