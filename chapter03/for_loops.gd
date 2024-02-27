extends Node2D


func _ready() -> void:
	var inventory = ["Boots", "Bananas", "Bandages"]
	
	for item in inventory:
		print("You possess ", item)
