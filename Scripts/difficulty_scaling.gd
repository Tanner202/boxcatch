extends Node2D

@onready var apple_spawner: Node2D = $"../AppleSpawner"
@export var min_spawn_interval = 1
@export var decrease_interval_speed = 0.05
var current_spawn_interval = 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_spawn_interval > min_spawn_interval:
		current_spawn_interval -= decrease_interval_speed * delta
		apple_spawner.set_spawn_interval(current_spawn_interval)
	elif current_spawn_interval < min_spawn_interval:
		current_spawn_interval = min_spawn_interval
		
