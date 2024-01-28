extends Area2D



func _on_body_entered(body):
	if body.is_in_group("Player"):
		if State.cable_status == "has":
				SceneSwitcher.switch_scene("res://scenes/computer_puzzle/computer_assembly.tscn")
