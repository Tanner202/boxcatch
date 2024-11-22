extends Area2D

@export var collection_sound : AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	collection_sound.play()
	body.queue_free()

func _on_area_entered(area: Area2D) -> void:
	collection_sound.play()
	area.get_parent().queue_free()
