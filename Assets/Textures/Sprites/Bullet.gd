extends RigidBody2D

func _process(delta):
	bullet_die()
	

func bullet_die():
	await get_tree().create_timer(1.0).timeout
	free()
