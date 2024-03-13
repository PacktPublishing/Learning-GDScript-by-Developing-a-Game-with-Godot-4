extends Node2D


const MAX_HEALTH: int = 10


@onready var _health_label: Label = $HealthLabel


@export_range(0, MAX_HEALTH) var health: int = 10:
	get:
		return health
	set(new_value):
		health = clamp(new_value, 0, MAX_HEALTH)
		update_health_label()


func _ready():
	update_health_label()


func update_health_label():
	if not is_instance_valid(_health_label):
		return

	_health_label.text = str(health) + "/" + str(MAX_HEALTH)


func change_health(difference: int):
	health += difference
