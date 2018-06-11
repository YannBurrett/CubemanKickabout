extends KinematicBody

export var speed = 10
export var friction = 0.25
export var gravity = 5

var motion = Vector3()
const DOWN = Vector3(0,1,0)

var me = self.name
var up
var down
var left
var right

func _ready():
	if me == "Player":
		up = "ui_up_2"
		down = "ui_up_2"
		left = "ui_left_2"
		right = "ui_right_2"
	else:
		up = "ui_up"
		down = "ui_down"
		left = "ui_left"
		right = "ui_right"
		

func _physics_process(delta):
	move()
	check_floor()

func move():
	if Input.is_action_pressed(left) && not Input.is_action_pressed(right):
		motion.z -= 1
	elif Input.is_action_pressed(right) && not Input.is_action_pressed(left):
		motion.z += 1
	else:
		motion.z = lerp(motion.z, 0, friction)
	
	if Input.is_action_pressed(up) && not Input.is_action_pressed(down):
		motion.x += 1
	elif Input.is_action_pressed(down) && not Input.is_action_pressed(up):
		motion.x -= 1
	else:
		motion.x = lerp(motion.x, 0, friction)
		
	clamp (motion.x, -speed, speed)
	clamp (motion.z, -speed, speed)
	
	move_and_slide(motion, DOWN)


func check_floor():
	if not is_on_floor():
		motion.y =- gravity
	else:
		motion.y = 0