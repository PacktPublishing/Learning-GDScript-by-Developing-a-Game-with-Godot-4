extends Node2D


func _ready() -> void:
	var number_of_lives = 0 
	var damage_type = "fire" 

	if number_of_lives <= 0: 
		print("You died!") 
		if damage_type == "fire": 
			print("By going up in flames") 
		elif damage_type == "water": 
			print("By drowning")
	else:
		print("You live!")
