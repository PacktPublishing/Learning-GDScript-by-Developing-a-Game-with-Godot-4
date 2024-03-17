extends CenterContainer


func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://screens/ui/menu.tscn")
