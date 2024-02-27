class_name Player extends CharacterBody2D


signal died


const MAX_HEALTH: int = 10


var pojectile_scene: PackedScene = preload("res://parts/projectile/projectile.tscn")


@onready var _health_label: Label = $Health
@onready var _camera_2d = $CameraPosition/Camera2D


@export var health: int = 10:
	get:
		return health
	set(new_value):
		if is_dead: return

		health = clamp(new_value, 0, MAX_HEALTH)
		update_health_label()

		if health == 0:
			died.emit()
			set_physics_process(false)
			is_dead = true

@export var max_speed: float = 500.0
@export var acceleration: float = 2500.0
@export var deceleration: float = 1500.0
@export var shoot_distance: float = 400.0


var is_dead: bool = false


func _enter_tree():
	set_multiplayer_authority(name.to_int())


func _ready():
	update_health_label()

	_camera_2d.enabled = is_multiplayer_authority()


func update_health_label():
	if not is_instance_valid(_health_label):
		return

	_health_label.text = str(health) + "/" + str(MAX_HEALTH)


func change_health(difference: int):
	health += difference


func _physics_process(delta: float):
	if not is_multiplayer_authority(): return

	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)

	move_and_slide()


func _on_shoot_timer_timeout():
	if not multiplayer.is_server(): return

	if is_dead: return

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

	var new_projectile: Projectile = pojectile_scene.instantiate()
	new_projectile.target = closest_enemy
	new_projectile.position = global_position
	get_parent().add_child(new_projectile, true)
