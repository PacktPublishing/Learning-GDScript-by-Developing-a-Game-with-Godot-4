extends Node


var highscore: int = 0


func set_new_highscore(value: int):
	if value > highscore:
		highscore = value
