class_name Enemy extends CharacterBody2D


@onready var _navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D


@export var max_speed: float = 400.0
@export var acceleration: float = 1500.0
@export var deceleration: float = 1500.0


var target: Node2D


func _ready():
	var player_nodes: Array = get_tree().get_nodes_in_group("player")
	if not player_nodes.is_empty():
		target = player_nodes[0]


func _physics_process(delta):
	_navigation_agent_2d.target_position = target.global_position

	if _navigation_agent_2d.is_navigation_finished():
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	else:
		var next_position: Vector2 = _navigation_agent_2d.get_next_path_position()
		var direction_to_next_position: Vector2 = global_position.direction_to(next_position)
		velocity = velocity.move_toward(direction_to_next_position * max_speed, acceleration * delta)
	move_and_slide()


func _on_player_detection_area_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return

	body.health -= 1
	queue_free()
