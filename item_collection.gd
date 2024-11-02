extends Area2D

@onready var label = get_node("/root/Level/ScoreLabel")
var score = 0

func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	score += 1
	label.text = "Score: " + str(score)
	
