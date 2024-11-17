class_name Health

extends Node2D

signal on_health_changed
signal on_player_death

var health = 3

func take_damage():
	health -= 1
	on_health_changed.emit()
	if health <= 0:
		on_player_death.emit()

func get_health() -> int:
	return health
