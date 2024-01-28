extends Area2D

var entered = false

func _on_body_entered(body):
	entered = true


func _on_body_exited(body):
	entered = false
	

func action():
	print("Action DootToTeen with key status: ", State.key_status == "has", " | entered? ", entered)
	if State.key_status == "has":
		SceneSwitcher.switch_scene("res://scenes/teenRoom.tscn")

