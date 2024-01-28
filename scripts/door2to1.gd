extends Area2D

var entered = false


func _on_body_entered(body):
	entered = true

func _on_body_exited(body):
	entered = false

func _process(delta):
	if entered:
		if Input.is_action_just_pressed("click"):
			get_tree().change_scene_to_file("res://scenes/main.tscn")
