extends Node2D

@export var apple = preload("res://apple.tscn")

func _on_timer_timeout() -> void:
	var spawned_apple = apple.instantiate()
	spawned_apple.global_position = Vector2(global_position.x + randf_range(-500, 500), global_position.y)
	get_tree().root.add_child(spawned_apple)
