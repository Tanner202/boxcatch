extends Node


func load_level():
	get_tree().change_scene_to_file("res://Scenes/level.tscn")

func load_menu():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
