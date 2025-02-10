extends Node2D

var nopes = ['[center]not this one[/center]', '[center]not in here[center]']


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.handle_click($cabinetHover1):
		$cabinetHover1.modulate.a = 0.3
	else:
		$cabinetHover1.modulate.a = 0
	if Global.handle_click($cabinetHover2):
		$cabinetHover2.modulate.a = 0.3
	else:
		$cabinetHover2.modulate.a = 0
	if Global.handle_click($cabinetHover3):
		$cabinetHover3.modulate.a = 0.3
	else:
		$cabinetHover3.modulate.a = 0
	if Input.is_action_just_pressed("select"):
		if Global.isFindFile == true:
			if Global.handle_click($HoverArrow):
				get_tree().change_scene_to_file("res://office.tscn")
			if Global.handle_click($dialogueBox):
				$dialogueBox.position = Vector2(999999999, 9999999999)
				$RichTextLabel.text = ''
		if !Global.isFindFile:
			if Global.handle_click($cabinetHover1):
				$dialogueBox.position = Vector2(580, 580)
				$RichTextLabel.text = nopes[0]
			if Global.handle_click($cabinetHover2):
				$dialogueBox.position = Vector2(580, 580)
				$RichTextLabel.text = "[center]Ah here it is![/center]"
				Global.isFindFile = true
				Global.secondOfficeDialogue = true
				Global.reset = true
			if Global.handle_click($cabinetHover3):
				$dialogueBox.position = Vector2(580, 580)
				$RichTextLabel.text = nopes[1]
		else:
			if Global.handle_click($cabinetHover1):
				$dialogueBox.position = Vector2(580, 580)
				$RichTextLabel.text = "[center]I already found the file![/center]"
			if Global.handle_click($cabinetHover2):
				$dialogueBox.position = Vector2(580, 580)
				$RichTextLabel.text = "[center]I already found the file![/center]"
			if Global.handle_click($cabinetHover3):
				$dialogueBox.position = Vector2(580, 580)
				$RichTextLabel.text = "[center]I already found the file![/center]"
				

