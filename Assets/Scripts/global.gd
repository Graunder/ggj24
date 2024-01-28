extends Node

var enemy_count : int = 0

var bad_jokes = [["res://Assets/Scenes/Dialog_boxes/dialog_box_1.tscn", false], 
["res://Assets/Scenes/Dialog_boxes/dialog_box_2.tscn", false],
["res://Assets/Scenes/Dialog_boxes/dialog_box_3.tscn", false],
["res://Assets/Scenes/Dialog_boxes/dialog_box_4.tscn", false],
["res://Assets/Scenes/Dialog_boxes/dialog_box_5.tscn", false],
["res://Assets/Scenes/Dialog_boxes/dialog_box_6.tscn", false],
["res://Assets/Scenes/Dialog_boxes/dialog_box_7.tscn", false],
["res://Assets/Scenes/Dialog_boxes/dialog_box_8.tscn", false],
["res://Assets/Scenes/Dialog_boxes/dialog_box_9.tscn", false],
["res://Assets/Scenes/Dialog_boxes/dialog_box_10.tscn", false],
["res://Assets/Scenes/Dialog_boxes/dialog_box_11.tscn", false]]

func _reset_globals():
	for i in bad_jokes:
		i[1] = false
	#print("Finished Reseting Globals")

