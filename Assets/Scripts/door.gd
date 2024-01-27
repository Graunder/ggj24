extends Node2D

func _on_area_2d_body_entered(body):
	if(body.get_name() == "Player"):
		queue_free()
