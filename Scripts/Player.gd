extends KinematicBody

const DOWN = Vector3(0,1,0)
const GRAVITY = 5

export var speed = 7
export var friction = .2

var motion = Vector3()

var left = ""
var right = ""
var up = ""
var down = ""

func _ready():
	pass

