extends Node2D

var logic_components = []
var start_zones = []
# Called when the node enters the scene tree for the first time.

func find_index(zone_id):
	var index = 0
	for i in range(len(start_zones)):
		#print(start_zones[i].name)
		if start_zones[i].name == zone_id:
			#print("found")
			index = i
			
	if index == 0:
		print("what")
	return index
	
func calc_and(value1, value2):
	if value1=="1" and value2=="1":
		return "1"
	else:
		return "0"
	
func calc_or(value1, value2):
	if value1=="1" or value2=="1":
		return "1"
	else:
		return "0"
		
func calc_xor(value1, value2):
	if (value1=="1" and value2=="1") or (value1=="0" and value2=="0"):
		return "0"
	else:
		return "1"
	
func calc_nand(value1, value2):
	if calc_and(value1,value2) == "1":
		return "0"
	else:
		return "1"

func calc_nor(value1, value2):
	if calc_or(value1,value2) == "1":
		return "0"
	else:
		return "1"
	
func calc_xnor(value1, value2):
	if calc_xor(value1,value2) == "1":
		return "0"
	else:
		return "1"
	
func check_drop_zone(drop_zone_node, input_1_node, input_2_node):
	if drop_zone_node.occupied == -1:
		return "-"
	elif input_1_node.text == "-" or input_2_node.text == "-":
		return "-"
	elif drop_zone_node.occupied == 10:
		return calc_and(input_1_node.text, input_2_node.text)
	elif drop_zone_node.occupied == 6:
		return calc_or(input_1_node.text, input_2_node.text)
	elif drop_zone_node.occupied == 5:
		return calc_nand(input_1_node.text, input_2_node.text)
	elif drop_zone_node.occupied == 7:
		return calc_nor(input_1_node.text, input_2_node.text)
	elif drop_zone_node.occupied == 9:
		return calc_xor(input_1_node.text, input_2_node.text)
	elif drop_zone_node.occupied == 8:
		return calc_xnor(input_1_node.text, input_2_node.text)
		
		
	
func update_labels():
	get_node("output_lbl2").text = get_node("a_btn").text
	get_node("output_lbl5").text = get_node("a_btn").text
	get_node("output_lbl4").text = get_node("b_btn").text
	get_node("output_lbl").text = get_node("b_btn").text
	get_node("output_lbl7").text = get_node("cin_btn").text
	get_node("output_lbl13").text = get_node("cin_btn").text
		
	get_node("output_lbl3").text = check_drop_zone(get_node("drop_zone"),get_node("output_lbl"),get_node("output_lbl2"))
	get_node("output_lbl6").text = check_drop_zone(get_node("drop_zone2"),get_node("output_lbl5"),get_node("output_lbl4"))
	
	get_node("output_lbl14").text = get_node("output_lbl6").text
	get_node("output_lbl8").text = get_node("output_lbl6").text
	get_node("output_lbl10").text = get_node("output_lbl3").text
	
	get_node("output_lbl9").text = check_drop_zone(get_node("drop_zone3"),get_node("output_lbl7"),get_node("output_lbl8"))
	get_node("output_lbl15").text = check_drop_zone(get_node("drop_zone5"),get_node("output_lbl14"),get_node("output_lbl13"))
	
	get_node("output_lbl11").text = get_node("output_lbl9").text
	
	get_node("output_lbl12").text = check_drop_zone(get_node("drop_zone4"),get_node("output_lbl10"),get_node("output_lbl11"))
	
func find_on_top():
	var first_and = false
	var first_nand = false
	var first_or = false
	var first_nor = false
	var first_xor = false
	var first_xnor = false
	for component in logic_components:
		if component.name == "node_and" or component.name == "node_and2" or component.name == "node_and3" or component.name == "node_and4" or component.name == "node_and5":
			if component.rest_point == component.starting_rest_zone.global_position:
				if not first_and:
					component.on_top = true
					first_and = true
				else:
					component.on_top = false
		elif component.name == "node_nand" or component.name == "node_nand2" or component.name == "node_nand3" or component.name == "node_nand4" or component.name == "node_nand5":
			if component.rest_point == component.starting_rest_zone.global_position:
				if not first_nand:
					component.on_top = true
					first_nand = true
				else:
					component.on_top = false
		elif component.name == "node_or" or component.name == "node_or2" or component.name == "node_or3" or component.name == "node_or4" or component.name == "node_or5":
			if component.rest_point == component.starting_rest_zone.global_position:
				if not first_or:
					component.on_top = true
					first_or = true
				else:
					component.on_top = false
		elif component.name == "node_nor" or component.name == "node_nor2" or component.name == "node_nor3" or component.name == "node_nor4" or component.name == "node_nor5":
			if component.rest_point == component.starting_rest_zone.global_position:
				if not first_nor:
					component.on_top = true
					first_nor = true
				else:
					component.on_top = false
		elif component.name == "node_xor" or component.name == "node_xor2" or component.name == "node_xor3" or component.name == "node_xor4" or component.name == "node_xor5":
			if component.rest_point == component.starting_rest_zone.global_position:
				if not first_xor:
					component.on_top = true
					first_xor = true
				else:
					component.on_top = false
		elif component.name == "node_xnor" or component.name == "node_xnor2" or component.name == "node_xnor3" or component.name == "node_xnor4" or component.name == "node_xnor5":
			if component.rest_point == component.starting_rest_zone.global_position:
				if not first_xnor:
					component.on_top = true
					first_xnor = true
				else:
					component.on_top = false

func check_success():
	if get_node("drop_zone").occupied != 10:
		return false
	if get_node("drop_zone2").occupied != 9:
		return false
	if get_node("drop_zone3").occupied != 10:
		return false
	if get_node("drop_zone4").occupied != 6:
		return false
	if get_node("drop_zone5").occupied != 9:
		return false
		
	return true
		

func _ready():
	logic_components = get_tree().get_nodes_in_group("logic_component")
	start_zones = get_tree().get_nodes_in_group("zone")
	
	for zone in start_zones:
		if zone.name == "start_and":
			zone.set_position(Vector2(750, 420))
			zone.get_children()[1].text = "[center]AND[/center]"
		elif zone.name == "start_or":
			zone.set_position(Vector2(880, 420))
			zone.get_children()[1].text = "[center]OR[/center]"
		elif zone.name == "start_nand":
			zone.set_position(Vector2(750, 520))
			zone.get_children()[1].text = "[center]NAND[/center]"
		elif zone.name == "start_nor":
			zone.set_position(Vector2(880, 520))
			zone.get_children()[1].text = "[center]NOR[/center]"
		elif zone.name == "start_xor":
			zone.set_position(Vector2(1010, 420))
			zone.get_children()[1].text = "[center]XOR[/center]"
		elif zone.name == "start_xnor":
			zone.set_position(Vector2(1010, 520))
			zone.get_children()[1].text = "[center]XNOR[/center]"
	
	for component in logic_components:
		if component.name == "node_and" or component.name == "node_and2" or component.name == "node_and3" or component.name == "node_and4" or component.name == "node_and5":
			component.get_children()[0].texture = load("res://assets/logic_gates/and.png")
			component.starting_pos_index = find_index("start_and")
			
			if component.name == "node_and":
				component.on_top = true
			component._ready()
		elif component.name == "node_or" or component.name == "node_or2" or component.name == "node_or3" or component.name == "node_or4" or component.name == "node_or5" :
			component.get_children()[0].texture = load("res://assets/logic_gates/or.png")
			component.starting_pos_index = find_index("start_or")
			
			if component.name == "node_or":
				component.on_top = true
			component._ready()
		elif component.name == "node_nand" or component.name == "node_nand2" or component.name == "node_nand3" or component.name == "node_nand4" or component.name == "node_nand5":
			component.get_children()[0].texture = load("res://assets/logic_gates/nand.png")
			component.starting_pos_index = find_index("start_nand")
			
			if component.name == "node_nand":
				component.on_top = true
			component._ready()
		elif component.name == "node_nor" or component.name == "node_nor2" or component.name == "node_nor3" or component.name == "node_nor4" or component.name == "node_nor5":
			component.get_children()[0].texture = load("res://assets/logic_gates/nor.png")
			component.starting_pos_index = find_index("start_nor")
			
			if component.name == "node_nor":
				component.on_top = true
			component._ready()
		elif component.name == "node_xor" or component.name == "node_xor2" or component.name == "node_xor3" or component.name == "node_xor4" or component.name == "node_xor5":
			component.get_children()[0].texture = load("res://assets/logic_gates/xor.png")
			component.starting_pos_index = find_index("start_xor")
			
			if component.name == "node_xor":
				component.on_top = true
			component._ready()
		elif component.name == "node_xnor" or component.name == "node_xnor2" or component.name == "node_xnor3" or component.name == "node_xnor4" or component.name == "node_xnor5":
			component.get_children()[0].texture = load("res://assets/logic_gates/xnor.png")
			component.starting_pos_index = find_index("start_xnor")
			
			if component.name == "node_xnor":
				component.on_top = true
			component._ready()
	
	update_labels()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			if check_success():
				print("done!")
				#for label in get_tree().get_nodes_in_group("output_labels"):
				#	label.bbcode_enabled = true
				#	label.push_color(Color(0,1,0,1))
				State.logic_solved = true
				SceneSwitcher.switch_scene("res://scenes/main.tscn")
					
			find_on_top()
			update_labels()
				
				

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_b_btn_pressed():
	update_labels()


func _on_a_btn_pressed():
	update_labels()


func _on_cin_btn_pressed():
	update_labels()
