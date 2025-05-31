extends Node


@onready var pause_menu = $CanvasLayer/PauseMenu


func _ready():
	pause_menu.visible = false
	pause_menu.pause_mode = Node.PROCESS_MODE_ALWAYS


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		print("ESC detectado en NivelBase")
		if get_tree().paused:
			resume_game()
		else:
			pause_game()
	elif event.is_action_pressed("ui_pause"):
		print("P detectado en NivelBase")
		MusicaGlobal.toggle_music()

func pause_game():
	print("PAUSANDO JUEGO")
	get_tree().paused = true
	pause_menu.visible = true
	pause_menu.process_mode = Node.PROCESS_MODE_ALWAYS
	MusicaGlobal.pause_music()

func resume_game():
	print("REANUDANDO JUEGO")
	get_tree().paused = false
	pause_menu.visible = false
	MusicaGlobal.resume_music()
