extends CharacterBody2D

signal on_item_collected

@export var SPEED = 300.0

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("right"):
		velocity.x = SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_pressed("slow_down"):
		velocity.x /= 2
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	on_item_collected.emit()
