extends Area2D

var player_health : Health

func _ready() -> void:
	player_health = Player.instance.get_health()

func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	body.explode()
	player_health.take_damage()


func _on_area_entered(area: Area2D) -> void:
	area.get_parent().queue_free()
	player_health.take_damage()
