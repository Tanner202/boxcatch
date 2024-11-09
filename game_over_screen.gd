extends Node2D

@onready var score_txt: Label = $ScoreTxt
@onready var game_over_txt: Label = $GameOverTxt
@onready var score_manager: Node2D = $"../ScoreManager"
@onready var retry_btn: MenuButton = $RetryBtn

func update_score():
	score_txt.text = "Score: " + str(score_manager.get_score())

func _on_retry_btn_pressed() -> void:
	print("Pressed Retry Button")
	get_tree().reload_current_scene()
