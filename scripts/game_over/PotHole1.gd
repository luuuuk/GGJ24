extends Area2D

func _ready():
	pass

func _on_body_entered(_body):
	SceneSwitcher.switch_scene("res://scenes/game_over/game_over.tscn")
