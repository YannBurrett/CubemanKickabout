extends CanvasLayer

var P1_score = 0
var P2_score = 0
export var max_score = 1

func _ready():
	$Title.bbcode_text = "[center]CubeDude Kickabout[/center]"
	update_score()

func _on_Goal1():
	P1_score += 1
	update_score()
	
func _on_Goal2():
	P2_score +=1
	update_score()

func update_score():
	$P1Score.bbcode_text = "[center]" + str(P1_score) + "[/center]"
	$P2Score.bbcode_text = "[center]" + str(P2_score) + "[/center]"
	compare_max_score()


func compare_max_score():
	if P1_score == max_score || P2_score == max_score:
		game_over()

func game_over():
		$Title.bbcode_text = "[center]Game Over![/center]"