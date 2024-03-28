extends Node


@onready var _game_over_menu: CenterContainer = $CanvasLayer/GameOverMenu
@onready var _enemy_spawner: Node2D = $EnemySpawner
@onready var _health_potion_spawner: Node2D = $HealthPotionSpawner
@onready var _time_label: Label = $CanvasLayer/TimerUI/TimeLabel
@onready var _ip_label = $CanvasLayer/NetworkUI/IPLabel
@onready var _player_multiplayer_spawner: MultiplayerSpawner = $PlayerMultiplayerSpawner
@onready var _player_start_positions: Node2D = $PlayerStartPositions


@export var player_scene: PackedScene

var _player_spawn_index: int = 0


var _time: float = 0.0:
	set(value):
		_time = value
		_time_label.text = str(floor(_time))


func _ready():
	_player_multiplayer_spawner.spawn_function = spawn_player

	if multiplayer.is_server():
		show_local_ip_address()

		multiplayer.peer_connected.connect(add_player)
		add_player(1)
		
		for peer in multiplayer.get_peers():
			add_player(peer)
	else:
		set_process(false)


func show_local_ip_address():
	var addresses = []
	for ip in IP.get_local_addresses():
		if ip.begins_with("10.") or ip.begins_with("172.16.") or ip.begins_with("192.168."):
			addresses.push_back(ip)
	if not addresses.is_empty():
		_ip_label.text = addresses[0]


func _process(delta: float):
	_time += delta


func add_player(id: int):
	_player_multiplayer_spawner.spawn(id)


func spawn_player(id: int):
	var player: Player = player_scene.instantiate()
	player.multiplayer_id = id
	player.died.connect(_on_player_died)
	
	var spawn_marker: Marker2D = _player_start_positions.get_child(_player_spawn_index)
	player.position = spawn_marker.position
	_player_spawn_index = (_player_spawn_index + 1) % _player_start_positions.get_child_count()
	
	return player


func _on_player_died() -> void:
	end_game.rpc()


@rpc("authority", "reliable", "call_local")
func end_game():
	_game_over_menu.show()

	_enemy_spawner.stop_timer()
	_health_potion_spawner.stop_timer()

	set_process(false)
	Highscore.set_new_highscore(_time)
