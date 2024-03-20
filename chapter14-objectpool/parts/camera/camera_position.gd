extends Node2D


@export var camera_distance: float = 200
@export var position_smooth_speed: float = 12.0
@export var position_interpolation_speed: float = 55.0


func _physics_process(_delta):
	position = lerp(position, get_parent().velocity.normalized() * camera_distance, position_interpolation_speed * _delta)
