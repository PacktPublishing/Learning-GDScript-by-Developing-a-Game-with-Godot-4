extends Node2D


@export var entity_scene: PackedScene
@export var spawn_interval: float = 1.5


@onready var _spawn_timer: Timer = $SpawnTimer
@onready var _positions: Node2D = $Positions


func _ready():
	start()


func spawn_entity():
	var random_position: Marker2D = _positions.get_children().pick_random()

	var new_entity: Node2D = entity_scene.instantiate()
	new_entity.position = random_position.position
	add_child(new_entity)


func _on_spawn_timer_timeout():
	spawn_entity()


func start():
	_spawn_timer.start(spawn_interval)


func stop():
	_spawn_timer.stop()
