class_name Arrow extends Node2D


signal died


const SPEED: float = 200.0
const MAX_DISTANCE: float = 500.0


var direction: Vector2
var flown_distance: float


func _process(delta):
	position += direction * SPEED * delta
	
	flown_distance += SPEED * delta
	if flown_distance > MAX_DISTANCE:
		died.emit()


func set_alive():
	set_process(true)
	show()
	
	direction = Vector2.RIGHT.rotated(randf_range(0.0, TAU))
	rotation = direction.angle()
	flown_distance = 0.0
