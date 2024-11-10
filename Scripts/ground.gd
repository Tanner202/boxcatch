extends Area2D

@onready var health = $"../Health"

func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	health.take_damage()
