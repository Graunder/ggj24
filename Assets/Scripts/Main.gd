extends Node

@onready var menu = $Camera/Menu
@onready var time_text = $Camera/Menu/GameFinish/CenterContainer/VBoxContainer/Panel/WonText/TimeText
@onready var level = $Level
@onready var player = $Level/Player

@onready var sfx_bg_music = $SFX_bg_music
@onready var sfx_fbi = $SFX_fbi

var level_instance

#For level timer
var time : float = 0.0
var timeM : int = 0
var timeS : int = 0
var timeMS : int = 0
var completion_time_text
var playing : bool = false

func unload_level():
	if (is_instance_valid(level_instance)):
		level_instance.queue_free()
	level_instance = null
	
func load_level(level_name : String):
	unload_level()
	var level_path := "res://Assets/Scenes/Levels/%s.tscn" % level_name
	var level_resource := load(level_path)
	if (level_resource):
		level_instance = level_resource.instantiate()
		level.add_child(level_instance)
		menu.hide()
		menu.set_process(false)
	time = 0.0

func load_dev_scene():
	menu.switch_play_button(true)
	load_level("DEV_Level")
	level.get_tree().paused = false

func game_pause(should_pause : bool):
	level.get_tree().paused = should_pause
	if (should_pause):
		menu.show()
		playing = false
		#Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	else:
		menu.hide()
		playing = true
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func simple_pause():
	level.get_tree().paused = true
	#playing = false

func reset_pause():
	level.get_tree().paused = false
	#playing = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	level.get_tree().paused = true
	menu.grab_start_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(playing):
		time += delta
		timeMS = fmod(time, 1) * 100
		timeS = fmod(time, 60)
		timeM = fmod(time, 3600) / 60
	
	if Input.is_action_just_pressed("esc") && !level.get_tree().paused && level_instance != null:
		if menu.is_visible_in_tree():
			game_pause(false)
			playing = false
		else:
			game_pause(true)
			menu.grab_resume_focus()
			playing = true
			
	if(level_instance != null && Global.enemy_count == 0):
		menu._win_lose(true)

func _process_time_played():
	completion_time_text = "%02d:" % timeM
	completion_time_text += "%02d." % timeS
	completion_time_text += "%03d" % timeMS
	time_text.text = "[font_size={50}][center][b]" + completion_time_text + " [/b][/center][/font_size]"

func _play_fbi():
	sfx_fbi.play()
