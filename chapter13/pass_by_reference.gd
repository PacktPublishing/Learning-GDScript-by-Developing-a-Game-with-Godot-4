extends Node2D


func _ready():
	var dictionary: Dictionary = { "value": 5 }
	print("Dictionary before the function: ", dictionary)
	function_taking_dictionary(dictionary)
	print("Dictionary after the function: ", dictionary)


func function_taking_dictionary(dictionary: Dictionary):
	dictionary["a_value"] = "has changed"
	print("Dictionary during the function: ", dictionary)
