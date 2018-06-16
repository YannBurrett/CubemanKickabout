extends Spatial


var up = Vector3(0,-1,0)

func _physics_process(delta):
	var Ball = get_parent().get_node("Ball")
	$DSLSpotLight.look_at(Ball.translation, up)
	$USLSpotLight.look_at(Ball.translation, up)
	$DSRSpotLight.look_at(Ball.translation, up)
	$USRSpotLight.look_at(Ball.translation, up)