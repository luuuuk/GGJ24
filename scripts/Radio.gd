extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/rickroll.dialogue"), "start")
	await get_tree().create_timer(7.0).timeout
	SceneSwitcher.switch_scene("res://scenes/game_over/game_over.tscn")
