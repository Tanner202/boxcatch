extends Area2D

@onready var health = $"../Health"

func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	body.explode()
	health.take_damage()


func _on_area_entered(area: Area2D) -> void:
	area.get_parent().queue_free()
	health.take_damage()
