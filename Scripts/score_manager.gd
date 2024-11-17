extends Node2D

signal on_score_changed

var score = 0
var high_score : int

func _ready() -> void:
	high_score = FileSaveSystem.load_data()["high-score"]

func add_score(amount: int):
	score += amount
	on_score_changed.emit(score)
	if score > high_score:
		print("saved score")
		FileSaveSystem.save_high_score(score)

func get_score() -> int:
	return score

func _on_item_collected() -> void:
	add_score(1)
