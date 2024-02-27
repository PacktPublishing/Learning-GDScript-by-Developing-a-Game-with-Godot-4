extends Node2D


class BaseArrow:
	func describe_damage():
		print("Pierces a person")


class FireArrow extends BaseArrow:
	func describe_damage():
		super()
		print("And sets them ablaze")


func _ready():
	var fire_arrow: FireArrow = FireArrow.new()
	fire_arrow.describe_damage()
