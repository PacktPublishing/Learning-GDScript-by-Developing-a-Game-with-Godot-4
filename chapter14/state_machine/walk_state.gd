extends State


var _player: Player = owner


@export var max_speed: float = 500.0
@export var acceleration: float = 2500.0
@export var deceleration: float = 1500.0


func process(delta: float):
	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	if input_direction != Vector2.ZERO:
		_player.velocity = _player.velocity.move_toward(input_direction * max_speed, acceleration * delta)
	else:
		_player.velocity = _player.velocity.move_toward(Vector2.ZERO, deceleration * delta)

	_player.move_and_slide()


func input(event: InputEvent):
	if event.is_action_pressed("jump"):
		_state_machine.transition("Jump")
