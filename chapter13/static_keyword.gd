extends Node2D


class BaseArrow:
	static var damage: float = 10.0
	
	static func describe_damage():
		print("Pierces a person")


func _ready():
	BaseArrow.describe_damage()
	print(BaseArrow.damage)
