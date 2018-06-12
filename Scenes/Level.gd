extends Spatial

onready var ball = $Ball
onready var goal1 = $Goal1Detect
onready var goal2 = $Goal2Detect
onready var P1spawn = $Player1Spawn
onready var P2spawn = $Player2Spawn
onready var P1 = $Player1
onready var P2 = $Player2
onready var timer = $Timer

func _ready():
	reset()

func reset():
	ball.translation = Vector3(0,2.5,0)
	P1.translation = P1spawn.translation
	P2.translation = P2spawn.translation

func _on_Goal1Detect_body_entered(body):
	if body == ball:
		print("goal 1")
		goal()

func _on_Goal2Detect_body_entered(body):
	if body == ball:
		print("goal 2")
		goal()


func goal():
	timer.start()


func _on_Timer_timeout():
	reset()
