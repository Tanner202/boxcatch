extends VBoxContainer

@export var game_scene : PackedScene

func _on_play_btn_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)

func _on_quit_btn_pressed() -> void:
	FileSaveSystem.save_game()
	get_tree().quit()
