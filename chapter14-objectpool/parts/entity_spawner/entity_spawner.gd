extends Node2D


@export var entity_scene: PackedScene
@export var spawn_interval: float = 1.5


@onready var _spawn_timer: Timer = $SpawnTimer
@onready var _positions: Node2D = $Positions
@onready var _multiplayer_spawner = $MultiplayerSpawner


func _ready():
	_multiplayer_spawner.add_spawnable_scene(entity_scene.resource_path)
	
	if multiplayer.is_server():
		start_timer()


func spawn_entity():
	var random_position: Marker2D = _positions.get_children().pick_random()

	var new_entity: Node2D = entity_scene.instantiate()
	new_entity.position = random_position.position
	add_child(new_entity, true)


func _on_spawn_timer_timeout():
	spawn_entity()


func start_timer():
	_spawn_timer.start(spawn_interval)


func stop_timer():
	_spawn_timer.stop()
