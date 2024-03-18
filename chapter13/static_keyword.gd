extends Node2D


class Enemy:
	static var damage: float = 10.0
	
	static func describe_damage():
		print("Pierces a person")


func _ready():
	print(Enemy.damage)
	Enemy.describe_damage()
