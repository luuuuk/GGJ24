extends Node2D

var starting_pos_index = 0
var selected = false
var on_top = false
var rest_point
var rest_nodes = []
var start_nodes = []
var previous_rest_zone
var starting_rest_zone


func _ready():
	#start_nodes = get_tree().get_nodes_in_group("start_zones")
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[starting_pos_index].global_position
	rest_nodes[0].deselect()
	rest_nodes[starting_pos_index].select(starting_pos_index)
	starting_rest_zone = rest_nodes[starting_pos_index]
	previous_rest_zone = rest_nodes[starting_pos_index]
	
	

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if on_top:
			selected = true
		
func _physics_process(delta): 
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)
		if previous_rest_zone.name == "drop_zone" or previous_rest_zone.name == "drop_zone3" or previous_rest_zone.name == "drop_zone4":
			rotation = lerp_angle(rotation, PI/2, 10*delta)
		else:
			rotation = lerp_angle(rotation, 0, 10*delta)
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			#print("test")
			selected = false
			var shortest_dist = 75
			#var new_zone = false
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist and (child.occupied == -1 or child == starting_rest_zone):
					if previous_rest_zone != starting_rest_zone:
						previous_rest_zone.deselect()
					#previous_rest_zone.deselect()
					child.select(starting_pos_index)
					previous_rest_zone = child
					rest_point = child.global_position
					shortest_dist = distance
					#new_zone = true
					
					
			#if not new_zone:
			#	rest_point = starting_rest_zone.global_position
			#	previous_rest_zone.deselect()
			#	previous_rest_zone = starting_rest_zone
