extends Node2D


@onready var _game_over_menu: CenterContainer = $CanvasLayer/GameOverMenu
@onready var _enemy_spawner: Node2D = $EnemySpawner
@onready var _health_potion_spawner: Node2D = $HealthPotionSpawner
@onready var _time_label: Label = $CanvasLayer/TimerUI/TimeLabel
@onready var _ip_label = $CanvasLayer/NetworkUI/IPLabel


@export var player_scene: PackedScene


var _time: float = 0.0:
	set(value):
		_time = value
		_time_label.text = str(floor(_time))


func _ready():
	if multiplayer.is_server():
		show_local_ip_address()

		multiplayer.peer_connected.connect(add_player)
		add_player(1)


func show_local_ip_address():
	var addresses = []
	for ip in IP.get_local_addresses():
		if ip.begins_with("10.") or ip.begins_with("172.16.") or ip.begins_with("192.168."):
			addresses.push_back(ip)
	if not addresses.is_empty():
		_ip_label.text = addresses[0]


func _process(delta: float):
	if multiplayer.is_server():
		_time += delta


func add_player(id: int):
	var player: Player = player_scene.instantiate()
	player.name = str(id)
	add_child(player)

	player.died.connect(_on_player_died)


func _on_player_died() -> void:
	end_game.rpc()


@rpc("authority", "reliable", "call_local")
func end_game():
	_game_over_menu.show()

	_enemy_spawner.stop()
	_health_potion_spawner.stop()

	set_process(false)
	Highscore.set_new_highscore(_time)
