extends Node2D


func _ready():
	var number_of_lives = 3
	print(number_of_lives)
	
	var fire_ball_damage = 2
	number_of_lives -= number_of_lives
	print("The number of lives is: ", number_of_lives)
	
	const FIRE_BALL_DAMAGE = 2
	number_of_lives -= FIRE_BALL_DAMAGE
	print("The number of lives is: ", number_of_lives)
	
#	FIRE_BALL_DAMAGE = 10
	
	print("%.20f" % (0.1 + 0.1)) 
