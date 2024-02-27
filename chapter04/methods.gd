extends Node2D


var player_health = 10


func _ready() -> void:
	print(player_health)
	lower_player_health(5)
	print(player_health)
	lower_player_health(2)
	print(player_health)
	lower_player_health(-1)
	print(player_health)
	
	print(minimum(2, 8))
	print(minimum(-50, -1028))


func lower_player_health(amount):
	player_health -= amount


func minimum(number1, number2):
	if number1 < number2:
		return number1
	else:
		return number2
