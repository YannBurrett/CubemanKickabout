extends "res://Scripts/Player.gd"

func _ready():
	left = "ui_left"
	right = "ui_right"
	down = "ui_down"
	up = "ui_up"
	
func _physics_process(delta):
	move()
	check_floor()

func move():
	if Input.is_action_pressed(left) && not Input.is_action_pressed(right):
		motion.z = - speed
	elif Input.is_action_pressed(right) && not Input.is_action_pressed(left):
		motion.z = speed
	else:
		motion.z = lerp(motion.z, 0, friction)

	
	if Input.is_action_pressed(up) && not Input.is_action_pressed(down):
		motion.x = speed
	elif Input.is_action_pressed(down) && not Input.is_action_pressed(up):
		motion.x = -speed
	else:
		motion.x = lerp(motion.x, 0, friction)
		
	clamp (motion.x, -speed, speed)
	clamp (motion.z, -speed, speed)
	
	move_and_slide(motion, DOWN)


func check_floor():
	if not is_on_floor():
		motion.y =- GRAVITY
	else:
		motion.y = 0