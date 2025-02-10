extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	$officeArrowHover.modulate.a = 0
	$streetArrowHover.modulate.a = 0
	$"Back-arrow".modulate.a = 0
	if Global.isOfficeDialogue or Global.secondOfficeDialogue:
		$diologueBox.position = Vector2(576, 561)
	if !Global.isOfficeDialogue and !Global.secondOfficeDialogue:
		$diologueBox.position = Vector2(999999, 9999999)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$officeHover.modulate.a = 0
	if Global.isOfficeDialogue and !Global.secondOfficeDialogue:
		if Global.reset:
			Global.officeReset()
			Global.reset = false
		if Global.i == Global.t:
			# Start the dialogue showing process when ready
			Global._show_dialogue(Global.officeDialogue1, $RichTextLabel)
		if Input.is_action_just_pressed("select"):
			if Global.handle_click($diologueBox):
				if Global.i < len(Global.officeDialogue1):
					Global.t += 1
					Global.j = 0
				else:
					$diologueBox.position = Vector2(999999, 999999)
					Global.isOfficeDialogue = false
					Global.j = 99
				$RichTextLabel.text = '[center][/center]'
	if !Global.isOfficeDialogue and Global.secondOfficeDialogue:
		if Global.reset:
			Global.officeReset()
			Global.reset = false
		if Global.i == Global.t:
			Global._show_dialogue(Global.officeDialogue2, $RichTextLabel)
		if Input.is_action_just_pressed("select"):
			if Global.handle_click($diologueBox):
				if Global.i < len(Global.officeDialogue2):
					Global.t += 1
					Global.j = 0
				else:
					$diologueBox.position = Vector2(99999, 99999)
					Global.secondOfficeDialogue = false
					Global.j = 99
				$RichTextLabel.text = '[center][/center]'
	if !Global.isOfficeDialogue and !Global.secondOfficeDialogue:
		if Global.isCheckBack:
			$"Back-arrow".modulate.a = 1
			if Global.handle_click($streetArrowHover):
				$streetArrowHover.modulate.a = 0.3
			else:
				$streetArrowHover.modulate.a = 0
			if Input.is_action_just_pressed("select"):
				if Global.handle_click($"Back-arrow"):
					get_tree().change_scene_to_file("res://street.tscn")
			if !Global.isFindKey:
				if Input.is_action_just_pressed("select"):
					if Global.handle_click($officeHover):
						get_tree().change_scene_to_file("res://offcie_desk.tscn")
		if Input.is_action_just_pressed("select"):
			if Global.handle_click($checkBack):
				Global.isCheckBack = true
				get_tree().change_scene_to_file("res://back_of_office.tscn")
		if !Global.isFindKey && Global.isFindFile:
			if !Global.handle_click($officeHover):
				$officeHover.modulate.a = 0
			elif Global.handle_click($officeHover):
				$officeHover.modulate.a = 0.3
		if Global.handle_click($officeArrowHover):
			$officeArrowHover.modulate.a = 0.3
		else:
			$officeArrowHover.modulate.a = 0
func handle_click(item):
	var mouse_pos = get_global_mouse_position()
	
	# Get the global position and size of the duplicate
	var item_pos = item.global_position
	var size = item.get_texture().get_size() * item.get_global_scale()  # Assuming `duplicate` has a texture
	
	# Create a Rect2 using the duplicate's position and size
	var rect = Rect2(item_pos - size * 0.5, size).abs()
	
	# Check if the mouse is within the bounding box
	return rect.has_point(mouse_pos)
