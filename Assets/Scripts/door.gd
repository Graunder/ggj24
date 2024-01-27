extends Node2D

var main : Node
var camera : Camera2D
var menu : Control

var dialog_instance



func _ready():
	main = get_tree().get_root().get_node("main")
	camera = main.get_node("Camera")
	menu = camera.get_node("Menu")

func _on_area_2d_body_entered(body):
	if(body.get_name() == "Player"):
		main.simple_pause()
		var dialog_box_path := "res://Assets/Scenes/dialog_box.tscn"
		var dialog_box_resource := load(dialog_box_path)
		if(dialog_box_resource):
			dialog_instance = dialog_box_resource.instantiate()
			camera.add_child(dialog_instance)
			var box = camera.get_node("Dialog_Box")
			await box.door_interaction_complete
			free()
			#await box.isDone
			#queue_free()
			#var btn = box.get_node("MarginContainer/Panel/KnockButton")
			#btn.grab_focus()
		
		#await get_tree().create_timer(1.0).timeout
		#queue_free()
