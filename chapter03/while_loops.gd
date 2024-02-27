extends Node2D


func _ready() -> void:
	var inventory = ["Boots", "Bananas", "Bandages", "Warm Gloves", "Goggles"] 

	while inventory.size() > 3: 
		inventory.remove_at(0) 
