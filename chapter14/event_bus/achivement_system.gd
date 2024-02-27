extends Node


func _ready():
	EventBus.subscribe("killed_boss", on_boss_killed)


func on_boss_killed():
	print("Achivement Unlocked: Kill the Boss")
