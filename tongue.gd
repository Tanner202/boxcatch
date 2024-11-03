extends Node2D

@export var speed = 50

var is_catching = false
var is_retracting = false
var max_scale = 4

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("catch") and !is_catching:
		is_catching = true
	
func _process(delta: float) -> void:
	if is_catching:
		if !is_retracting:
			if scale.y < max_scale:
				scale.y += speed * delta
			elif scale.y >= max_scale:
				is_retracting = true
		else:
			if scale.y > 0.01:
				scale.y -= speed * delta
			elif scale.y < 0.01:
				scale.y = 0
				is_catching = false
				is_retracting = false
				
