extends Node2D

@export var speed = 50
@onready var timer: Timer = $Timer

var is_catching = false
var max_scale = 4

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("catch"):
		is_catching = true
	
func _process(delta: float) -> void:
	if is_catching:
		if scale.y < max_scale:
			scale.y += speed * delta
		elif scale.y >= max_scale:
			is_catching = false
	else:
		if scale.y > 0.01:
			scale.y -= speed * delta
		elif scale.y < 0:
			scale.y = 0
