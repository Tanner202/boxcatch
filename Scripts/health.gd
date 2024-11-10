extends Node2D

signal on_health_changed
@onready var game_over_screen: Node2D = $"../GameOverScreen"

var health = 3

func take_damage():
	
	health -= 1
	on_health_changed.emit()
	if health <= 0:
		game_over_screen.show()
		game_over_screen.update_score()
		get_tree().paused = true

func get_health() -> int:
	return health
