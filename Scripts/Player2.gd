extends "res://Scripts/Player.gd"

func ready():
	pass

func _physics_process(delta):
	move()
	check_floor()

func move():
	if Input.is_action_pressed("ui_left_2") && not Input.is_action_pressed("ui_right_2"):
		motion.z = - speed
	elif Input.is_action_pressed("ui_right_2") && not Input.is_action_pressed("ui_left_2"):
		motion.z = speed
	else:
		motion.z = lerp(motion.z, 0, friction)
	
	if Input.is_action_pressed("ui_up_2") && not Input.is_action_pressed("ui_down_2"):
		motion.x = speed
	elif Input.is_action_pressed("ui_down_2") && not Input.is_action_pressed("ui_up_2"):
		motion.x = - speed
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