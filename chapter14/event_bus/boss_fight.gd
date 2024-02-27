extends Node


func _ready():
	while randf() < 0.99:
		print("You're fighting the boss!")
	print("The boss dies x.x")
	EventBus.publish("killed_boss")
