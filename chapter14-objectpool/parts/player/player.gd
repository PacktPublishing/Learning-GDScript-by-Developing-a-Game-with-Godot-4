class_name Player extends CharacterBody2D


signal died


const MAX_HEALTH: int = 10


@export var pojectile_scene: PackedScene = preload("res://parts/projectile/projectile.tscn")


@onready var _health_label: Label = $HealthLabel
@onready var _shoot_timer = $ShootTimer
@onready var _camera_position: Node2D = $CameraPosition


@export_range(0, MAX_HEALTH) var health: int = 10:
	get:
		return health
	set(new_value):
		var new_health: int = clamp(new_value, 0, MAX_HEALTH)

		if health > 0 and new_health == 0:
			died.emit()
			set_physics_process(false)
			_shoot_timer.stop()
		
		health = new_health
		update_health_label()

@export var max_speed: float = 500.0
@export var acceleration: float = 2500.0
@export var deceleration: float = 1500.0
@export var shoot_distance: float = 400.0


var multiplayer_id: int


func _enter_tree() -> void:
	set_multiplayer_authority(multiplayer_id)
	$HealthMultiplayerSynchronizer.set_multiplayer_authority(1)


func _ready():
	update_health_label()

	if not multiplayer.is_server():
		_shoot_timer.stop()

	if not is_multiplayer_authority():
		_camera_position.queue_free()
		set_physics_process(false)


func update_health_label():
	if not is_instance_valid(_health_label):
		return

	_health_label.text = str(health) + "/" + str(MAX_HEALTH)


func _physics_process(delta: float):
	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)

	move_and_slide()


func get_hit():
	health -= 1


func _on_shoot_timer_timeout():
	var closest_enemy: Enemy
	var smallest_distance: float = INF

	var all_enemies: Array = get_tree().get_nodes_in_group("enemy")

	for enemy in all_enemies:
		var distance_to_enemy: float = global_position.distance_to(enemy.global_position)
		if distance_to_enemy < smallest_distance:
			closest_enemy = enemy
			smallest_distance = distance_to_enemy

	if not closest_enemy:
		return

	if smallest_distance > shoot_distance:
		return

	var new_projectile: Projectile = get_parent().projectile_pool.get_dead_node()
	if new_projectile:
		new_projectile.target = closest_enemy
		new_projectile.position = global_position
