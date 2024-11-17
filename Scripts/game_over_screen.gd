extends Node2D

@export_group("UI")
@export var score_txt: Label
@export var game_over_txt: Label
@export var retry_btn : Button

func _ready() -> void:
	var player_health = Player.instance.get_health()
	player_health.on_player_death.connect(game_over)

func game_over():
	show()
	update_score()
	get_tree().paused = true

func update_score():
	score_txt.text = "Score: " + str(ScoreManager.get_score())

func _on_retry_btn_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
