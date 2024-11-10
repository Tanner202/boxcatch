extends Control

var main_menu = preload("res://main_menu.tscn")

func _on_resume_btn_pressed() -> void:
	get_tree().paused = false
	hide()


func _on_settings_btn_pressed() -> void:
	print("Pause Menu")


func _on_main_menu_btn_pressed() -> void:
	get_tree().change_scene_to_packed(main_menu)
