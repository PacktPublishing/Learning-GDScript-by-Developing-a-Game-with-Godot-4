extends Node


@onready var _game_over_menu: CenterContainer = $CanvasLayer/GameOverMenu
@onready var _enemy_spawner: Node2D = $EnemySpawner
@onready var _health_potion_spawner: Node2D = $HealthPotionSpawner
@onready var _time_label: Label = $CanvasLayer/TimerUI/TimeLabel
@onready var _ip_label = $CanvasLayer/NetworkUI/IPLabel
@onready var _player_multiplayer_spawner: MultiplayerSpawner = $PlayerMultiplayerSpawner


@export var player_scene: PackedScene


var projectile_pool: ObjectPool
var projectile_scene: PackedScene = preload("res://parts/projectile/projectile.tscn")


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
		
		projectile_pool = ObjectPool.new(projectile_scene, 50, self)
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
	
	return player


func _on_player_died() -> void:
	end_game.rpc()


@rpc("authority", "reliable", "call_local")
func end_game():
	_game_over_menu.show()

	_enemy_spawner.stop_timer()
	_health_potion_spawner.stop_timer()

	set_process(false)
	HighscoreManager.set_new_highscore(_time)
	
	
func _exit_tree():
	if projectile_pool:
		projectile_pool.free_nodes()
		projectile_pool.free()
