extends Camera2D

@onready var character_body_2d = $"../CharacterBody2D"

func _process(delta):
	position = character_body_2d.position
