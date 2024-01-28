extends Node2D

var speed = 100

func _process(delta):	
	var direction_look_x = Input.get_axis("look_left", "look_right")
	var direction_look_y = Input.get_axis("look_up", "look_down")
	
	if direction_look_x:
		position.x = direction_look_x * speed
	if direction_look_y:
		position.y = direction_look_y * speed
