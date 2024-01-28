extends CharacterBody2D

var motion = Vector2()

func _process(delta):
	var Player = get_tree().get_root().get_node("main/Level/Player")
	
	position += (Player.position - position) / 50
	look_at(Player.position)
	
	move_and_collide(motion)
