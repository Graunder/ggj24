extends Control

@onready var start_text = $MarginContainer/Panel/StartText
#@onready var knock_button = $MarginContainer/Panel/KnockButton
@onready var knock_button = $MarginContainer/Panel/KnockButton/Button2
@onready var knock_text = $MarginContainer/Panel/KnockText
@onready var answer_text = $MarginContainer/Panel/AnswerText
#@onready var name_button = $MarginContainer/Panel/NameButton
@onready var name_button = $MarginContainer/Panel/NameButton/Button2
@onready var name_answer_text = $MarginContainer/Panel/NameAnswerText
#@onready var line = $MarginContainer/Panel/Line
@onready var line = $MarginContainer/Panel/Line/Button2
@onready var line_text = $MarginContainer/Panel/LineText
@onready var sfx_knock = $SFX_Knock

var main : Node
signal door_interaction_complete

func _ready():
	main = get_tree().get_root().get_node("main")
	knock_button.grab_focus()

func knock_knock():
	start_text.hide()
	knock_button.hide()
	knock_text.show()
	sfx_knock.play()
	await get_tree().create_timer(2.0).timeout
	knock_text.hide()
	answer_text.show()
	name_button.show()
	name_button.grab_focus()
	
func tell_name():
	answer_text.hide()
	name_button.hide()
	name_answer_text.show()
	line.show()
	line.grab_focus()
	
func show_punchline():
	name_answer_text.hide()
	line.hide()
	line_text.show()
	await get_tree().create_timer(2.0).timeout
	main.reset_pause()
	door_interaction_complete.emit()
	free()
	
func trigger_focus():
	knock_button.grab_focus()

