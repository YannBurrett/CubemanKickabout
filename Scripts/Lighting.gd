extends Spatial

const UP= Vector3(0,-1,0)

func _physics_process(delta):
	var ball = get_parent().get_node("Ball")
	get_tree().call_group("lights", "look_at", ball.translation, UP)