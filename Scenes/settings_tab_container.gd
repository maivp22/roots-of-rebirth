class_name Settings_Tab_Container
extends Control

@onready var exit_button: Button = $Exit_Button





signal exit_options_menu

	
func _ready():

	exit_button.pressed.connect(_on_exit_button_pressed)
	
	if !MusicaGlobal.music_player.playing:
		MusicaGlobal.music_player.play()

	


func _on_exit_button_pressed() -> void:
	print("Botón de salir presionado!")
	get_tree().change_scene_to_file("res://Scenes/mainmenu.tscn")
