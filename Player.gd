extends KinematicBody2D

#Force Constants
const GRAVITY = 600
const WALK_FORCE = 800
const STOP_FORCE = 1300

# Max speeds
const MAX_SPEED = 600
const JUMP_SPEED = 400
const WALK_MAX_SPEED = 200

# Global Vars
var velocity = Vector2.ZERO

#func _input(event):
#	if Input.
#	if event is InputEventKey:
#		if event.scancode == KEY_LEFT:
#			$OurSprite.play("walk")
#		elif event.scancode == KEY_RIGHT:
#			$OurSprite.play("walk")
#		elif event.scancode == KEY_UP:
#			$OurSprite.play("Up")
#		elif event.scancode == KEY_SPACE:
#			$OurSprite.play("Up")
	


func _physics_process(delta):
	var walk = WALK_FORCE * (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))	
	var is_on_platform = is_on_floor()
	
	# Slow down the player if they're not trying to move.
	if walk == 0:
		if is_on_platform:
			# The velocity, slowed down a bit, and then reassigned.
			velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
		
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)
			
	
	# Vertical movement code. Apply gravity.
	velocity.y = velocity.y + (GRAVITY * delta)
	
	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_platform and Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP_SPEED
		
	
	# select  nimiation
	if is_on_platform:
		# On the platform
		if velocity.x == 0:
			$OurSprite.stop()
		elif velocity.x > 0 :
			$OurSprite.play("walk")
			$OurSprite.flip_h = false
		else:
			$OurSprite.play("walk")
			$OurSprite.flip_h = true	
	else:
		# In the air
		$OurSprite.play("Up")
		
		
	# Move based on the velocity and snap to the ground.
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)
		
	

