extends Node2D

signal on_health_changed
@onready var game_over_screen: Node2D = $"../GameOverScreen"

var game_over = false

var health = 3

func take_damage():
	if game_over:
		return
	
	health -= 1
	on_health_changed.emit()
	if health <= 0:
		game_over_screen.show()
		game_over_screen.update_score()
		game_over = true

func get_health() -> int:
	return health
