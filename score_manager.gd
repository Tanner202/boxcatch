extends Node2D

signal on_score_changed

var score = 0

func add_score(amount: int):
	score += amount
	on_score_changed.emit(score)

func get_score() -> int:
	return score

func _on_item_collected() -> void:
	add_score(1)
