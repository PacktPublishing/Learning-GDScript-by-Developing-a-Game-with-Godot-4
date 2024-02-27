extends Node2D


func _ready() -> void:
	print("Hello" if true else "Bye")
	
	var damage_type = "fire"
	var amount_of_damage = 5 if damage_type == "fire" else 1
	print(amount_of_damage)
