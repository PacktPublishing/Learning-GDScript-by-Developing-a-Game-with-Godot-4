extends Node2D


func _ready() -> void:
	print("The AND operator:")
	print(true and true)
	print(true and false)
	print(false and true)
	print(false and false)
	
	print("The OR operator:")
	print(true or true)
	print(true or false)
	print(false or true)
	print(false or false)
	
	print("The NOT operator:")
	print(not true)
	print(not false)
	
	print("Using parantheses:")
	print(true or (false and true))
	print(not(true and true) or false)
