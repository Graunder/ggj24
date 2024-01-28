extends CharacterBody2D

var motion = Vector2()

var can_attack : bool = false

func _ready():
	Global.enemy_count += 1

func _process(delta):
	if(can_attack):
		var Player = get_tree().get_root().get_node("main/Level/Player")
		position += (Player.position - position) / 200
		look_at(Player.position)
		
		move_and_collide(motion)
	


func _on_area_2d_body_entered(body):
	if "Bullet" in body.name:
		Global.enemy_count -= 1
		queue_free()
