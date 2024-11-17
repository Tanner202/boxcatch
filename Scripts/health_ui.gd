extends HBoxContainer

@export var broken_heart_texture : Texture2D
@export var health_icons : Array[TextureRect]

var player_health : Health

func _ready() -> void:
	player_health = Player.instance.get_health()
	player_health.on_health_changed.connect(on_health_changed)
	for heart_icon in get_children():
		health_icons.append(heart_icon)
	
func on_health_changed():
	var health_index = player_health.get_health()
	health_icons[health_index].texture = broken_heart_texture
