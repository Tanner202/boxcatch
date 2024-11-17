class_name Spawner

extends Node2D

@export var item_to_spawn : PackedScene
@export var is_horizontal = true
@export var timer_cooldown = 1
@export_range(0, 100, 1) var y_offset
@export var vertical_direction = 1
@export var timer : Timer

var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size
	timer.wait_time = timer_cooldown
	timer.start()

func _on_timer_timeout() -> void:
	if is_horizontal:
		spawn_horizontally()
	else:
		spawn_vertically()

func spawn_horizontally():
	var spawned_item = item_to_spawn.instantiate()
	spawned_item.global_position = Vector2(position.x + randf_range(-screen_size.x/2, screen_size.x/2), global_position.y)
	get_tree().root.get_node("Level").add_child(spawned_item)
	
func spawn_vertically():
	var spawned_item = item_to_spawn.instantiate()
	spawned_item.global_position = Vector2(global_position.x, position.y + randf_range(-y_offset, y_offset))
	spawned_item.set_direction(vertical_direction)
	get_tree().root.get_node("Level").add_child(spawned_item)
	
func set_spawn_interval(new_cooldown: float):
	timer.wait_time = new_cooldown
