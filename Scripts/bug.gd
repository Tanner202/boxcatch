extends Node2D

@export var speed = 50
@onready var area_2d: Area2D = $Area2D

func _process(delta: float) -> void:
	global_position.x += speed * delta
