class_name Projectile
extends Node2D


@export var speed: float = 600.0


var target: Node2D


func _process(delta):
	if not multiplayer.is_server(): return

	if not is_instance_valid(target):
		queue_free()
		return

	global_position = global_position.move_toward(target.global_position, speed * delta)
	look_at(target.global_position)


func _on_enemy_detection_area_body_entered(body: Node2D) -> void:
	if not multiplayer.is_server(): return

	body.queue_free()
	queue_free()
