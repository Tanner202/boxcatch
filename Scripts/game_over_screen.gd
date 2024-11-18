extends Control

@export_group("Scenes")
@export var main_menu : PackedScene

@export_group("UI")
@export var game_over_txt: Label
@export var score_txt: Label
@export var high_score_txt : Label
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
	high_score_txt.text = "High Score: " + str(ScoreManager.get_high_score())

func _on_retry_btn_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_main_menu_btn_pressed() -> void:
	get_tree().change_scene_to_packed(main_menu)
