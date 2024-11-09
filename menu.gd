extends VBoxContainer

var game_scene = preload("res://level.tscn")

func _on_play_btn_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)

func _on_quit_btn_pressed() -> void:
	get_tree().quit()
