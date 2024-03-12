extends Node2D


func _ready() -> void:
	var damage_type = "water"
	
	match damage_type:
		"fire":
			print("You did FIRE damage")
		"water":
			print("You did WATER damage")
		"electric":
			print("You did ELECTRIC damage")
		_:
			print("The damage type was not recognised")
