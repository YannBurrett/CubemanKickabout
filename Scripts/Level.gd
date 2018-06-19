extends Spatial

signal Goal1 
signal Goal2

var black = Color(0,0,0)
var purple = Color(0.25,0,0.25)
var green = Color(0,0.25,0)
var colour_target = black


func _ready():
	reset()


func reset(): # move the players and balls to the starting positions
	$WorldEnvironment.environment.background_color = black
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
		goal(purple)


func _on_Goal2Detect_body_entered(body):
	if $Timer.is_stopped():
		emit_signal("Goal2")
		$Player1.can_move = false
		$Player2.can_move = false
		goal(green)


func goal(colour):
	$Timer.start()
	$WorldEnvironment/Tween.interpolate_property($WorldEnvironment.environment,"background_color", black, colour, 0.5, Tween.TRANS_SINE, Tween.EASE_IN )
	$WorldEnvironment/Tween.start()

func _on_Timer_timeout():
	reset()
