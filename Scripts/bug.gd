extends Node2D

@export var speed = 50
@export var area_2d: Area2D
var direction = 1

func _process(delta: float) -> void:
	global_position.x += direction * speed * delta 
	
func set_direction(direction):
	self.direction = direction
