extends Node2D

@export var apple = preload("res://Scenes/apple.tscn")
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _on_timer_timeout() -> void:
	var spawned_apple = apple.instantiate()
	spawned_apple.global_position = Vector2(position.x + randf_range(-screen_size.x/2, screen_size.x/2), global_position.y)
	get_tree().root.get_node("Level").add_child(spawned_apple)
