extends Node2D

var main : Node

var dialog_instance

func _ready():
	main = get_tree().get_root().get_node("main")
	print(main.name)

func _on_area_2d_body_entered(body):
	if(body.get_name() == "Player"):
		main.simple_pause()
		var dialog_box_path := "res://Assets/Scenes/dialog_box.tscn"
		var dialog_box_resource := load(dialog_box_path)
		if(dialog_box_resource):
			dialog_instance = dialog_box_resource.instantiate()
			add_child(dialog_instance)
		#queue_free()
