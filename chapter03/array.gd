extends Node2D


func _ready():
	var inventory = ["Key", "Potion"]
	
	print(inventory)
	
	inventory.append("Sword")
	
	print(inventory)
	
	var loot = ["Gold Coin", "Dagger"]
	inventory.append_array(loot)
	
	print(inventory)
