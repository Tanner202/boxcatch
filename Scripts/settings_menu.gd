extends Control

@export var input_button : PackedScene
@export var v_box_container : VBoxContainer

var is_rebinding = false
var active_button : Button
var action_to_rebind : String

var inputs = {"left": "Left", "right": "Right", "slow_down": "Slow Down", "catch": "Catch"}

func _ready() -> void:
	if FileSaveSystem.load_data().has(FileSaveSystem.KEYBINDS) && FileSaveSystem.load_data()[FileSaveSystem.KEYBINDS] != null:
		load_keybinds()
	create_input_settings()
	
func load_keybinds():
	var saved_keybinds = FileSaveSystem.load_data()[FileSaveSystem.KEYBINDS]
	print(saved_keybinds)
	for action in InputMap.get_actions():
		if action in saved_keybinds:
			InputMap.action_erase_events(action)
			InputMap.action_add_event(action, saved_keybinds[action])
	
func create_input_settings():
	for input in InputMap.get_actions():
		if input in inputs:
			var button = input_button.instantiate()
			v_box_container.add_child(button)
			button.find_child("ActionLabel").text = input
			var input_text = InputMap.action_get_events(input)[0].as_text()
			button.find_child("KeybindLabel").text = input_text.trim_suffix(" (Physical)")
			button.pressed.connect(_on_input_button_pressed.bind(button, input))

func _on_input_button_pressed(button, action_to_rebind):
	is_rebinding = true
	active_button = button
	self.action_to_rebind = action_to_rebind

func _input(event: InputEvent) -> void:
	if is_rebinding and event is InputEventKey and event.is_pressed():
		InputMap.action_erase_events(action_to_rebind)
		InputMap.action_add_event(action_to_rebind, event)
		active_button.find_child("KeybindLabel").text = event.as_text()
		is_rebinding = false
		FileSaveSystem.save_keybinds()
		accept_event()


func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)


func _on_check_box_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)


func _on_fullscreen_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_exit_button_pressed() -> void:
	hide()
