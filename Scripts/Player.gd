extends KinematicBody

const DOWN = Vector3(0,1,0)
const GRAVITY = 5
const EPSILON = 0.00001

export var speed = 7
export var friction = .2
onready var animation = $"Scene Root/AnimationPlayer"

var motion = Vector3()

var left = ""
var right = ""
var up = ""
var down = ""
var direction = 0.0


func _physics_process(delta):
	move()
	check_floor()
	animate()


func move():
	if Input.is_action_pressed(left) && not Input.is_action_pressed(right):
		motion.z = - speed
		direction = 180
	elif Input.is_action_pressed(right) && not Input.is_action_pressed(left):
		motion.z = speed
		direction = 0
	else:
		motion.z = lerp(motion.z, 0, friction)


	if Input.is_action_pressed(up) && not Input.is_action_pressed(down):
		motion.x = speed
		direction = 90
	elif Input.is_action_pressed(down) && not Input.is_action_pressed(up):
		motion.x = -speed
		direction = -90
	else:
		motion.x = lerp(motion.x, 0, friction)
	
	set_rotation_degrees(Vector3(0,direction,0))
	
	move_and_slide(motion, DOWN)


func check_floor():
	if not is_on_floor():
		motion.y =- GRAVITY
	else:
		motion.y = 0


func animate():
	if motion.length() > EPSILON:
		if not animation.is_playing():
			animation.play("Bouncy Walk")
	else:
		animation.stop()