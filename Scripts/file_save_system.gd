extends Node2D

var data = {}

const FILE_LOCATION = "user://settings.cfg"
const GAME_SECTION = "game_data"
const HIGH_SCORE = "high-score"
const KEYBINDS = "keybinds"

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		save_game()
		get_tree().quit()

func save_keybinds():
	var keybinds = {}
	for action in InputMap.get_actions():
		keybinds[action] = InputMap.action_get_events(action)[0]
	data[KEYBINDS] = keybinds
	save_game()
	
func save_high_score(value):
	data[HIGH_SCORE] = value
	save_game()
	
func save_game():
	var config = ConfigFile.new()
	for item in data:
		config.set_value(GAME_SECTION, item, data[item])
	config.save(FILE_LOCATION)
	
func load_data():
	var config = ConfigFile.new()
	
	if config.load(FILE_LOCATION) == OK:
		data[HIGH_SCORE] = config.get_value(GAME_SECTION, HIGH_SCORE, 0)
		data[KEYBINDS] = config.get_value(GAME_SECTION, KEYBINDS)
	else:
		print("No file found. Using defaults.")
	return data
