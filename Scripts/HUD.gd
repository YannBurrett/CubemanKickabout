extends CanvasLayer

signal P1_Scored
signal P2_Scored

onready var P1_Scoreboard = $P1Score
onready var P2_Scoreboard = $P2Score

var P1_score = 0
var P2_score = 0

func _ready():
	update_score()

func _on_Goal1():
	P1_score += 1
	update_score()
	
func _on_Goal2():
	P2_score +=1
	update_score()

func update_score():
	P1_Scoreboard.bbcode_text = "[center]" + str(P1_score) + "[/center]"
	P2_Scoreboard.bbcode_text = "[center]" + str(P2_score) + "[/center]"