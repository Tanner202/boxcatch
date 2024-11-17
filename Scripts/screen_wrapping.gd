extends Node2D

@export var player : Node2D

var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.position.x > screen_size.x/2:
		player.position.x = -screen_size.x/2
	elif player.position.x < -screen_size.x/2:
		player.position.x = screen_size.x/2
