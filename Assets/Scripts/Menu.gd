extends Control

@onready var main = $"../.."
@onready var level = $"../../Level"
@onready var character_body_2d = $"../../Level/CharacterBody2D"

#Menus
@onready var main_menu = $MainMenu
@onready var options_menu = $OptionsMenu

#Main menu buttons
@onready var play = $MainMenu/CenterContainer/MainContainer/Play
@onready var resume = $MainMenu/CenterContainer/MainContainer/Resume
@onready var give_up = $MainMenu/CenterContainer/MainContainer/Give_Up
@onready var options = $MainMenu/CenterContainer/MainContainer/Options
@onready var quit = $MainMenu/CenterContainer/MainContainer/Quit

#Options menu buttons
@onready var back = $OptionsMenu/CenterContainer/VBoxContainer/HBoxContainer/Back
@onready var apply = $OptionsMenu/CenterContainer/VBoxContainer/HBoxContainer/Apply

func _on_play_pressed():
	main.load_dev_scene()
	level.get_tree().paused = false
	character_body_2d.show()

func _on_quit_pressed():
	get_tree().quit()

func _on_resume_pressed():
	main.game_pause(false)
	level.get_tree().paused = false

func _on_give_up_pressed():
	main.unload_level()
	main.reset_pause()
	switch_play_button(false)
	level.get_tree().paused = true
	character_body_2d.hide()

func _on_options_pressed():
	enable_options_menu(true)

func _on_back_pressed():
	enable_options_menu(false)

func _on_apply_pressed():
	pass # Replace with function body.

func switch_play_button(switch_buttons : bool):
	if switch_buttons:
		play.hide()
		resume.show()
		give_up.show()
		resume.grab_focus()
		resume.focus_neighbor_bottom = give_up.get_path()
		give_up.focus_neighbor_top = resume.get_path()
		give_up.focus_neighbor_bottom = options.get_path()
		options.focus_neighbor_top = give_up.get_path()
	else:
		play.show()
		resume.hide()
		give_up.hide()
		play.grab_focus()
		options.focus_neighbor_top = play.get_path()

func enable_options_menu(enable_options : bool):
	if enable_options:
		main_menu.hide()
		options_menu.show()
		back.grab_focus()
	else:
		options_menu.hide()
		main_menu.show()
		options.grab_focus()
		
func grab_start_focus():
	play.grab_focus()
	
func grab_resume_focus():
	resume.grab_focus()
