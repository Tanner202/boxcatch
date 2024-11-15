extends Control

var main_menu = preload("res://Scenes/main_menu.tscn")
@onready var settings_menu: Control = $settings_menu

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			hide()
		else:
			show()
		get_tree().paused = !get_tree().paused

func _on_resume_btn_pressed() -> void:
	get_tree().paused = false
	hide()


func _on_settings_btn_pressed() -> void:
	settings_menu.show()


func _on_main_menu_btn_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_packed(main_menu)
