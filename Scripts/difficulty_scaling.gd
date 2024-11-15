extends Node2D

@export var spawner : Spawner
@export var min_spawn_interval = 1
@export var decrease_interval_speed = 0.05
@export var starting_spawn_interval = 4
var current_spawn_interval

func _ready() -> void:
	current_spawn_interval = starting_spawn_interval

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_spawn_interval > min_spawn_interval:
		current_spawn_interval -= decrease_interval_speed * delta
		spawner.set_spawn_interval(current_spawn_interval)
	elif current_spawn_interval < min_spawn_interval:
		current_spawn_interval = min_spawn_interval
		
