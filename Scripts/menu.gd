extends Node2D

func _on_play_btn_pressed() -> void:
	SceneManager.load_level()

func _on_quit_btn_pressed() -> void:
	FileSaveSystem.save_game()
	get_tree().quit()
