extends Control


@onready var _highscore_label: Label = $CenterContainer/MainUIContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/HighscoreLabel


func _ready():
	_highscore_label.text = "Highscore: " + str(Highscore.highscore)


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://screens/game/main.tscn")


func _on_exit_button_pressed():
	get_tree().quit()
