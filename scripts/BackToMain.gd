extends Area2D



func _on_body_entered(body):
	if body.is_in_group("Player"):
		SceneSwitcher.switch_scene("res://scenes/main.tscn")

