class_name Settings_Tab_Container
extends Control

@onready var exit_button: Button = $Exit_Button
@onready var volume_slider: HSlider = $TabContainer/Sonido/MarginContainer/VBoxContainer/VolumeSlider
var config = ConfigFile.new()
var config_path = "user://settings.cfg"
signal exit_options_menu

	
func _ready():
	
	var err = config.load(config_path)
	if err == OK:
		var saved_volume = config.get_value("Audio", "volume", -30)  # -30 dB como predeterminado
		MusicaGlobal.set_volume(saved_volume)
		volume_slider.value = saved_volume
	else:
		volume_slider.value = MusicaGlobal.music_player.volume_db

	volume_slider.value_changed.connect(_on_volume_slider_value_changed)

	exit_button.pressed.connect(_on_exit_button_pressed)

func _on_exit_button_pressed() -> void:
	print("Botón de salir presionado!")
	get_tree().change_scene_to_file("res://Scenes/mainmenu.tscn")
	
	
func _input(event):
	if event.is_action_pressed("ui_pause"):
		MusicaGlobal.toggle_music()


func _on_volume_slider_value_changed(value: float) -> void:
	MusicaGlobal.set_volume(value)
	config.set_value("Audio", "volume", value)
	config.save(config_path)
