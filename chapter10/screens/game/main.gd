extends Node2D


@onready var _game_over_menu: CenterContainer = $CanvasLayer/GameOverMenu
@onready var _enemy_spawner: Node2D = $EnemySpawner
@onready var _health_potion_spawner: Node2D = $HealthPotionSpawner
@onready var _time_label: Label = $CanvasLayer/TimerUI/TimeLabel


var _time: float = 0.0:
	set(value):
		_time = value
		_time_label.text = str(floor(_time))


func _process(delta: float):
	_time += delta


func _on_player_died() -> void:
	_game_over_menu.show()

	_enemy_spawner.stop()
	_health_potion_spawner.stop()

	set_process(false)
	Highscore.set_new_highscore(_time)
