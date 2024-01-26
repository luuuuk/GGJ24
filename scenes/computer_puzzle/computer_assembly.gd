extends Node2D


var rest_nodes = []
var objects = []

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	objects = get_tree().get_nodes_in_group("objects")

func _on_button_pressed():
	var correct_arrangement = true
	for child in rest_nodes:
		if child.name == "end_zone_cpu" and child.occupied != 0:
			correct_arrangement = false
			print("found it!")
			break
		elif child.name == "end_zone_ram" and child.occupied != 1:
			correct_arrangement = false
			print("found it!")
			break
		elif child.name == "end_zone_gpu" and child.occupied != 2:
			correct_arrangement = false
			print("found it!")
			break
			
	if correct_arrangement:
		print("YES")
		get_tree().change_scene_to_file("res://scenes/computer_puzzle/test_zones.tscn")
	else:
		print("NO")
		for zone in rest_nodes:
			zone.deselect()
		for obj in objects:
			obj._ready()
		
		
