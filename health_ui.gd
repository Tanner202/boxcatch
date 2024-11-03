extends HBoxContainer

@onready var health: Node2D = $"../Health"

@export var broken_heart_texture : Texture2D
@export var health_icons : Array[TextureRect]

func _ready() -> void:
	health.connect("on_health_changed", on_health_changed)
	for heart_icon in get_children():
		health_icons.append(heart_icon)
	
func on_health_changed():
	var health_index = health.get_health()
	health_icons[health_index].texture = broken_heart_texture
