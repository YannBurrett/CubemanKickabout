extends Spatial

onready var DSL = $DSLSpotLight
onready var USL = $USLSpotLight
onready var DSR = $DSRSpotLight
onready var USR = $USRSpotLight

onready var Ball = get_parent().get_node("Ball")

var up = Vector3(0,-1,0)

func _physics_process(delta):
	DSL.look_at(Ball.translation, up)
	USL.look_at(Ball.translation, up)
	DSR.look_at(Ball.translation, up)
	USR.look_at(Ball.translation, up)