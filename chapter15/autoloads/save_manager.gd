extends Node


const SAVE_FILE_PATH: String = "user://save_data.save"


var save_data: Dictionary = {
	"highscore": 0
}


func _ready():
	read_save_data()


func read_save_data():
	if not FileAccess.file_exists(SAVE_FILE_PATH):
		return
		
	var save_file: FileAccess = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	var file_content: String = save_file.get_as_text()
	save_data = JSON.parse_string(file_content)


func write_save_data():
	var json_string: String = JSON.stringify(save_data)

	var save_file: FileAccess = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	save_file.store_string(json_string)


func save_highscore(new_highscore: float):
	save_data.highscore = new_highscore

	write_save_data()
