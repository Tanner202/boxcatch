extends Node2D

signal on_score_changed

var score = 0
var high_score : int

func _ready() -> void:
	if FileSaveSystem.load_data().has(FileSaveSystem.HIGH_SCORE):
		high_score = FileSaveSystem.load_data()[FileSaveSystem.HIGH_SCORE]

func add_score(amount: int):
	score += amount
	on_score_changed.emit(score)
	if score > high_score:
		FileSaveSystem.save_high_score(score)

func get_score() -> int:
	return score

func _on_item_collected() -> void:
	add_score(1)
