extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$carHover.modulate.a = 0
	$backToOfficeHover.modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("select"):
		if Global.isFindKey:
			if Global.handle_click($"carClick"):
				get_tree().change_scene_to_file("res://office.tscn")
		else:
			if Global.handle_click($carClick):
				$dialogueBox.position = Vector2(570, 577)
				$dialogue.text = '[center]I need the key to use this![/center]'
		if Global.handle_click($dialogueBox):
			$dialogueBox.position = Vector2(9999, 9999)
			$dialogue.text = ''
		if Global.handle_click($backToOffice):
			get_tree().change_scene_to_file("res://office.tscn")
	if Global.handle_click($carHover):
		$carHover.modulate.a = 0.3
	else:
		$carHover.modulate.a = 0
	if Global.handle_click($backToOfficeHover):
		$backToOfficeHover.modulate.a = 0.3
	else:
		$backToOfficeHover.modulate.a = 0
