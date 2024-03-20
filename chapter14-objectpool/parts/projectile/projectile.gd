class_name Projectile
extends Node2D


signal died


@export var speed: float = 600.0


@onready var _enemy_detection_area: Area2D = $EnemyDetectionArea


var target: Node2D


func _ready():
	set_dead()


func _physics_process(delta: float):
	if not is_instance_valid(target):
		died.emit()
		return

	global_position = global_position.move_toward(target.global_position, speed * delta)
	look_at(target.global_position)


func set_alive():
	if multiplayer.is_server():
		set_physics_process(true)
		_enemy_detection_area.monitoring = true
	show()


func set_dead():
	set_physics_process(false)
	_enemy_detection_area.set_deferred("monitoring", false)
	hide()


func _on_enemy_detection_area_body_entered(body: Node2D) -> void:
	body.get_hit()
	died.emit()
