extends Spatial

signal Goal1 
signal Goal2


func _ready():
	reset()
	$Player1.rotation_degrees = Vector3(0,180,0)


func reset(): # move the players and balls to the starting positions
	$Ball.translation = $Spawns/BallSpawn.translation
	$Player1.translation = $Spawns/Player1Spawn.translation
	$Player2.translation = $Spawns/Player2Spawn.translation


func _on_Goal1Detect_body_entered(body):
	if $Timer.is_stopped():
		emit_signal("Goal1")
		goal()


func _on_Goal2Detect_body_entered(body):
	if $Timer.is_stopped():
		emit_signal("Goal2")
		goal()


func goal():
	$Timer.start()


func _on_Timer_timeout():
	reset()
