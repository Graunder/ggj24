extends CharacterBody2D

var moveSpeed = 500
var bulletSpeed = 2000
var bullet = preload("res://Assets/Scenes/Bullet.tscn")

@onready var target = $"../Target"

func _process(delta):
	
	var joystick_vector = Vector2(Input.get_joy_axis(0, JOY_AXIS_RIGHT_X), Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y))
	var joystick_angle = atan2(joystick_vector.y, joystick_vector.x)
	print(joystick_angle)
	rotation = joystick_angle
	
	var direction_x = Input.get_axis("left", "right")
	var direction_y = Input.get_axis("forward", "backward")
	
	velocity.x = 0
	velocity.y = 0
	
	if direction_x:
		velocity.x = direction_x * moveSpeed
	if direction_y:
		velocity.y = direction_y * moveSpeed
		
	if (Input.is_action_just_pressed("shoot")):
		fire()
		
	move_and_slide()

func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = global_position.direction_to(target.position).angle()
	bullet_instance.apply_impulse(Vector2(), Vector2(bulletSpeed, 0).rotated(global_rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
