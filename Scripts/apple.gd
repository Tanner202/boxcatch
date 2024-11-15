extends RigidBody2D

@onready var gpu_particles_2d = preload("res://Scenes/apple_explosion.tscn")

func explode():
	var particles = gpu_particles_2d.instantiate()
	get_tree().root.get_node("Level").add_child(particles)
	particles.position = position
	particles.restart()
