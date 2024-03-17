extends Node2D


@export var entity_scene: PackedScene
@export var start_interval: float = 1.5
@export var end_interval: float = 0.5
@export var time_delta: float = -0.01


@onready var _spawn_timer: Timer = $SpawnTimer
@onready var _positions: Node2D = $Positions


var current_spawn_interval: float


func _ready():
	current_spawn_interval = start_interval
	start_timer()


func spawn_entity():
	var random_position: Marker2D = _positions.get_children().pick_random()

	var new_entity: Node2D = entity_scene.instantiate()
	new_entity.position = random_position.position
	add_child(new_entity)
	
	current_spawn_interval = clamp(current_spawn_interval + time_delta, start_interval, end_interval)


func _on_spawn_timer_timeout():
	spawn_entity()


func start_timer():
	_spawn_timer.start(current_spawn_interval)


func stop_timer():
	_spawn_timer.stop()
