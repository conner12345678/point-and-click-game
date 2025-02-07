extends Node2D
var diologue = ['hello fren', "wassup", "nerd", "wow"]
var j = 0
var t = 0
var i = 0
var dialogue_timer : Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	$"Back-arrow".modulate.a = 0
	if Global.isOfficeDiologue:
		$diologueBox.position = Vector2(576, 561)
	if !Global.isOfficeDiologue:
		$diologueBox.position = Vector2(999999, 9999999)
	dialogue_timer = Timer.new()
	dialogue_timer.one_shot = true
	add_child(dialogue_timer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$officeHover.modulate.a = 0
	if Global.isOfficeDiologue:
		if i == t:
			# Start the dialogue showing process when ready
			_show_dialogue()
		if Input.is_action_just_pressed("select"):
			if Global.handle_click($diologueBox):
				if i < len(diologue):
					t += 1
					j = 0
				else:
					$diologueBox.position = Vector2(999999, 999999)
					Global.isOfficeDiologue = false
					j = 99
				$RichTextLabel.text = '[center][/center]'
	if !Global.isOfficeDiologue:
		if Global.isCheckBack:
			$"Back-arrow".modulate.a = 1
		if Input.is_action_just_pressed("select"):
			if Global.handle_click($"Back-arrow"):
				get_tree().change_scene_to_file("res://street.tscn")
			if Global.handle_click($checkBack):
				Global.isCheckBack = true
				get_tree().change_scene_to_file("res://back_of_office.tscn")
		if !Global.handle_click($officeHover):
			$officeHover.modulate.a = 0
		elif Global.handle_click($officeHover):
			$officeHover.modulate.a = 0.3
func handle_click(item):
	var mouse_pos = get_global_mouse_position()
	
	# Get the global position and size of the duplicate
	var item_pos = item.global_position
	var size = item.get_texture().get_size() * item.get_global_scale()  # Assuming `duplicate` has a texture
	
	# Create a Rect2 using the duplicate's position and size
	var rect = Rect2(item_pos - size * 0.5, size).abs()
	
	# Check if the mouse is within the bounding box
	return rect.has_point(mouse_pos)

func _on_dialogue_timeout():
	_show_dialogue()

func _show_dialogue():
	if j < len(diologue[i]):
		# Add one character to the text
		$RichTextLabel.text += diologue[i][j]
		j += 1
		# Start the timer to add the next character after 0.1 seconds
		dialogue_timer.start(0.1)
	else:
		i += 1
