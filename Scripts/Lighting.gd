extends Spatial


var up = Vector3(0,-1,0)

func _physics_process(delta):
	var ball = get_parent().get_node("Ball")
#	get_tree().call_group("lights","look_at(ball.translation, up)") # can't get this working yet
	$DSLSpotLight.look_at(ball.translation, up)
	$USLSpotLight.look_at(ball.translation, up)
	$DSRSpotLight.look_at(ball.translation, up)
	$USRSpotLight.look_at(ball.translation, up)