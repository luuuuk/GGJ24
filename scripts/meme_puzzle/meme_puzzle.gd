extends Node2D

var zones = []
var pieces = []
var start_order = [15, 3, 8, 10, 4, 7, 1, 12, 14, 2, 6, 11, 9, 16, 13, 5]
var puzzle_solved = false

# Called when the node enters the scene tree for the first time.
func _ready():
	zones = get_tree().get_nodes_in_group("zones")
	pieces = get_tree().get_nodes_in_group("puzzle_piece")
	
	var y_cntr_start = 0
	var x_cntr_start = 0
	var y_cntr_end = 0
	var x_cntr_end = 0
	var piece_size = 82
	for zone in zones:
		if zone.name.begins_with("start_zone"):
			zone.set_position(Vector2(60+100*x_cntr_start,150+80*y_cntr_start))
			
			x_cntr_start += 1
			if x_cntr_start > 2:
				x_cntr_start = 0
				y_cntr_start += 1
				
		if zone.name.begins_with("end_zone"):
			zone.set_position(Vector2(469+piece_size/2+piece_size*x_cntr_end,174+piece_size/2+piece_size*y_cntr_end))
			
			x_cntr_end += 1
			if x_cntr_end > 3:
				x_cntr_end = 0
				y_cntr_end += 1
			
	
			
	var cntr = 0
	for piece in pieces:
		piece.starting_pos_index = start_order[cntr]-1
		piece._ready()
		
		cntr += 1
		
	

func check_success():
	var success = true
	var cntr = 15
	for zone in zones:
		if zone.name.begins_with("end_zone"):
			if zone.occupied != start_order[cntr]-1:
				success = false
			
			cntr -= 1
			
			
		#elif zone.name == "end_zone2":
		#	if zone.occupied != start_order[14]-1:
		#		success = false
		#elif zone.name == "end_zone3":
		#	if zone.occupied != start_order[13]-1:
		#		success = false
		
			
	
	return success

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			if puzzle_solved:
				print("done!")
			puzzle_solved = check_success()
			
				
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
