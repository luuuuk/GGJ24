extends Node

var current_scene = null


func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() -1)
	
func switch_scene(res_path):
	call_deferred("_deferred_switch_scene", res_path)


func _deferred_switch_scene(res_path):
	current_scene.free()
	var s = load(res_path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
	
	print(State.current_scene)
	
	if State.current_scene == "teenRoom" && res_path == "res://scenes/main.tscn":
		print("going from teen to main")
		get_tree().current_scene.get_node("Player").position = Vector2(-2060,-200)
	elif State.current_scene == "main" && res_path == "res://scenes/teenRoom.tscn":
		print("going from main to teen")
		get_tree().current_scene.get_node("Player").position = Vector2(0,0)
	elif State.current_scene == "logicPuzzle" && res_path == "res://scenes/main.tscn":
		print("going from logic to main")
		get_tree().current_scene.get_node("Player").position = Vector2(-2660,-200)
	elif State.current_scene == "memePuzzle" && res_path == "res://scenes/main.tscn":
		print("going from meme to main")
		get_tree().current_scene.get_node("Player").position = Vector2(-4200, -4200)
	
	if res_path == "res://scenes/logic_puzzle/logic_puzzle.tscn":
		State.current_scene = "logicPuzzle"
	elif res_path == "res://scenes/teenRoom.tscn":
		State.current_scene = "teenRoom"
	elif res_path == "res://scenes/main.tscn":
		State.current_scene = "main"
	elif res_path == "res://scenes/computer_puzzle/computer_assembly.tscn":
		State.current_scene = "computerPuzzle"
	elif res_path == "res://scenes/meme_puzzle/meme_puzzle.tscn":
		State.current_scene = "memePuzzle"
