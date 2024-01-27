extends Camera2D

@onready var player = $"../Level/Player"

func _process(delta):
	position = player.position
