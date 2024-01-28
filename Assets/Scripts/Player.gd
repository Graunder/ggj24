extends CharacterBody2D

var moveSpeed = 500
var bulletSpeed = 2000
var bullet = preload("res://Assets/Scenes/Bullet.tscn")

@onready var target = $"../Target"
@onready var menu = $"../../Camera/Menu"

func _process(delta):
	
	var joystick_vector = Vector2(Input.get_joy_axis(0, JOY_AXIS_RIGHT_X), Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y))
	var joystick_angle = atan2(joystick_vector.y, joystick_vector.x)
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
		
	#For testing
	if(Input.is_action_just_pressed("FFF")):
		menu._win_lose(false)
	if(Input.is_action_just_pressed("GGG")):
		menu._win_lose(true)
		
	move_and_slide()

func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(bulletSpeed, 0).rotated(rotation))
	#get_tree().get_root().call_deferred("add_child", bullet_instance)
	get_tree().get_root().get_node("main/Level").add_child(bullet_instance)
	
func kill():
	#get_tree().reload_current_scene()
	menu._win_lose(false)

func _on_area_2d_body_entered(body):
	if "Enemy" in body.name:
		kill()
