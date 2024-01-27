extends Node2D

var starting_pos_index = 0
var selected = false
var rest_point
var rest_nodes = []
var previous_rest_zone

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[starting_pos_index].global_position
	rest_nodes[starting_pos_index].select(starting_pos_index)
	previous_rest_zone = rest_nodes[starting_pos_index]

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		
func _physics_process(delta): 
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta)
	else:
		global_position = lerp(global_position, rest_point, 10 * delta)
		
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 75
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist and child.occupied == -1:
					previous_rest_zone.deselect()
					child.select(starting_pos_index)
					previous_rest_zone = child
					rest_point = child.global_position
					shortest_dist = distance
