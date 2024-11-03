extends Node2D

signal on_health_changed

var health = 3

func take_damage():
	health -= 1
	on_health_changed.emit()
	if health <= 0:
		get_tree().reload_current_scene()

func get_health() -> int:
	return health
