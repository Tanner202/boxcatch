extends Label

@export var player : CharacterBody2D

func _on_score_manager_on_score_changed(score: int) -> void:
	text = "Score: " + str(score)
