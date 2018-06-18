extends Spatial

signal Goal1 
signal Goal2


func _ready():
	reset()
	$Player1.rotation_degrees = Vector3(0,180,0)


func reset(): # move the players and balls to the starting positions
	$WorldEnvironment.environment.background_color = Color(0,0,0)
	$Ball.translation = $Spawns/BallSpawn.translation
	$Player1.translation = $Spawns/Player1Spawn.translation
	$Player2.translation = $Spawns/Player2Spawn.translation
	$Player1.can_move = true
	$Player2.can_move = true


func _on_Goal1Detect_body_entered(body):
	if $Timer.is_stopped():
		emit_signal("Goal1")
		$Player1.can_move = false
		$Player2.can_move = false
		$WorldEnvironment.environment.background_color = Color(0.25,0,0.25)
		goal()


func _on_Goal2Detect_body_entered(body):
	if $Timer.is_stopped():
		emit_signal("Goal2")
		$Player1.can_move = false
		$Player2.can_move = false
		$WorldEnvironment.environment.background_color = Color(0,0.25,0)
		goal()


func goal():
	$Timer.start()


func _on_Timer_timeout():
	reset()
