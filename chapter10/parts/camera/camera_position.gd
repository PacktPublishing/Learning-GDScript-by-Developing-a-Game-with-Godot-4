extends Node2D


@export var camera_distance: float = 200
@export var position_interpolation_speed: float = 5.0


@onready var _player: CharacterBody2D = get_parent()


func _physics_process(delta):
	var movement_direction: Vector2 = _player.velocity.normalized()
	var target_position: Vector2 = movement_direction * camera_distance

	position = position.lerp(target_position, position_interpolation_speed * delta)
