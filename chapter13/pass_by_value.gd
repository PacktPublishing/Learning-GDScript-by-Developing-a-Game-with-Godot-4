extends Node2D


func _ready():
	var number: int = 5
	print("Number before the function: ", number)
	function_taking_integers(number)
	print("Number after the function: ", number)
	
	var boolean: bool = true
	print("Boolean before the function: ", boolean)
	function_taking_boolean(boolean)
	print("Boolean after the function: ", boolean)
	
	var string: String = "Hello there!"
	print("String before the function: ", string)
	function_taking_strings(string)
	print("String after the function: ", string)
	
	var color: Color = Color(1, 1, 1, 1)
	print("Color before the function: ", color)
	function_taking_color(color)
	print("Color after the function: ", color)


func function_taking_integers(number: int):
	number += 1
	print("Number during the function: ", number)
	
	
func function_taking_boolean(boolean: bool):
	boolean = not boolean
	print("Boolean during the function: ", boolean)
	
	
func function_taking_strings(string: String):
	string[0] = "W"
	print("String during the function: ", string)
	
	
func function_taking_color(color: Color):
	color.a = 0.0
	print("Color during the function: ", color)
