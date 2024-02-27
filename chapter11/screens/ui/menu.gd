extends Control


const PORT: int = 7890


@onready var _highscore_label: Label = $CenterContainer/MainUIContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/HighscoreLabel
@onready var _ip_address_line_edit = $CenterContainer/MainUIContainer/PanelContainer/MarginContainer/VBoxContainer/VBoxContainer/IpAddressLineEdit


func _ready():
	_highscore_label.text = "Highscore: " + str(Highscore.highscore)

	if multiplayer.has_multiplayer_peer():
		multiplayer.multiplayer_peer.close()


func _on_play_button_pressed():
	if _ip_address_line_edit.text.is_empty():
		host_game()
	else:
		connect_to_game(_ip_address_line_edit.text)

	get_tree().change_scene_to_file("res://screens/game/main.tscn")


func _on_exit_button_pressed():
	get_tree().quit()


func host_game():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		return
	multiplayer.multiplayer_peer = peer


func connect_to_game(ip_address: String):
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(ip_address, PORT)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		return
	multiplayer.multiplayer_peer = peer
