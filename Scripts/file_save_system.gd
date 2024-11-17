extends Node2D

var data = {}

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		print("saved game")
		save_game()
		get_tree().quit()

func save_keybinds():
	var keybinds = {}
	for action in InputMap.get_actions():
		keybinds[action] = InputMap.action_get_events(action)[0]
	data["keybinds"] = keybinds
	save_game()
	
func save_high_score(value):
	data["high-score"] = value
	save_game()
	
func save_game():
	var config = ConfigFile.new()
	for item in data:
		config.set_value("game_data", item, data[item])
	config.save("user://settings.cfg")
	
func load_data():
	var config = ConfigFile.new()
	
	if config.load("user://settings.cfg") == OK:
		data["high-score"] = config.get_value("game_data", "high-score", 0)
		data["keybinds"] = config.get_value("game_data", "keybinds")
	else:
		print("No file found. Using defaults.")
	return data
