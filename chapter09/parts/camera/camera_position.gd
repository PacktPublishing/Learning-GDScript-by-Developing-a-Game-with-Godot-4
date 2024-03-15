extends Node2D


@export var camera_distance: float = 200
@export var position_smooth_speed: float = 12.0
@export var position_interpolation_speed: float = 55.0


@onready var _player: CharacterBody2D = get_parent()


func _process(_delta):
	var movement_direction: Vector2 = _player.velocity.normalized()
	var target_position: Vector2 = movement_direction * camera_distance
	
	position = lerp(position, target_position, position_interpolation_speed * _delta)
