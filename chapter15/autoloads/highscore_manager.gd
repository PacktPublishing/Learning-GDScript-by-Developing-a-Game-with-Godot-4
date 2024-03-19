extends Node


var highscore: int = 0


func _ready():
	highscore = SaveManager.save_data.highscore


func set_new_highscore(value: int):
	if value > highscore:
		highscore = value
		SaveManager.save_highscore(highscore)
