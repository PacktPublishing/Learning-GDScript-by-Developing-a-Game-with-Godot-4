extends Node


const SAVE_FILE_PATH: String = "user://save_data.json"


var save_data: Dictionary = {
	"highscore": 0
}


func _ready():
	read_save_data()


func read_save_data():
	var save_file: FileAccess = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	
	if not save_file:
		print("Could not open save file.")
		return

	var file_content: String = save_file.get_as_text()
	save_data = JSON.parse_string(file_content)


func write_save_data():
	var json_string: String = JSON.stringify(save_data)

	var save_file: FileAccess = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	
	if not save_file:
		print("Could not open save file.")
		return

	save_file.store_string(json_string)


func save_highscore(new_highscore: float):
	save_data.highscore = new_highscore

	write_save_data()
