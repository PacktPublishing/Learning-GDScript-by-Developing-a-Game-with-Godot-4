extends Node2D


func _ready():
	var print_hello: Callable = func(): print("hello")
	var print_largest: Callable = func(number_a: float, number_b: float):
		if number_a > number_b:
			print(number_a)
		else:
			print(number_b)
	
	print_largest.call(5, 10)
