extends CharacterBody2D

var moveSpeed = 500

func _physics_process(delta):
	
	var direction_x = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("forward", "backward")
	velocity.x = 0
	velocity.y = 0
	
	if direction_x:
		velocity.x = direction_x * moveSpeed
	if direction_y:
		velocity.y = direction_y * moveSpeed
	
	move_and_slide()
