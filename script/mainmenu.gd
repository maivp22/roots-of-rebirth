extends CanvasLayer


func _on_button_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/cinematica.tscn") # Replace with function body.


func _on_button_exit_pressed() -> void:
	get_tree().quit() # Replace with function body.

func _input(event):
	if(event.is_action_pressed("ui_accept")):
		_on_button_start_pressed()
	elif(event.is_action_pressed("ui_cancel")):
		_on_button_exit_pressed()
