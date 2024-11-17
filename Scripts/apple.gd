extends RigidBody2D

@export var gpu_particles_2d : PackedScene

func explode():
	var particles = gpu_particles_2d.instantiate()
	get_tree().root.get_node("Level").add_child(particles)
	particles.position = position
	particles.restart()
