extends Node2D


class Enemy: 
	var damage = 5 
	var health = 10 


var player_health: int = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var number_of_lives: int = 5
	var player_name: String = "Erik"
	var inventory: Array[String] = ["Cool Glasses", "Dringks"]
	var item: Dictionary = {
		"name": "Sword",
		"price": 8,
		"damage": 100.0
	}
	var enemy: Enemy = Enemy.new()
	
	take_damage(5)
	
	minimum(4.6, -7.8)


func take_damage(amount: int):
	player_health -= amount


func minimum(number1: float, number2: float) -> float:
	if number1 < number2:
		return number1
	else:
		return number2
