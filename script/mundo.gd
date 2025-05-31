extends Node2D

@onready var heartsContainer = $CanvasLayer/heartsContainer
@onready var player = $player

func _ready() -> void:
	MusicaGlobal.play_new_music("res://musica/mundoo.mp3")
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	player.healthChanged.connect(heartsContainer.updateHearts)
	
func _input(event):
	if event.is_action_pressed("ui_pause"):
		MusicaGlobal.toggle_music()

func _on_inventoy_gui_closed() -> void:
	get_tree().paused = false


func _on_inventoy_gui_opened() -> void:
	get_tree().paused = true
