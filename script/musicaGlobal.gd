extends Node

@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()
var is_paused = false


func toggle_music():
	is_paused = !is_paused
	music_player.stream_paused = is_paused
	
func _ready():
	
	music_player.stream = preload("res://musica/musica.mp3")
	add_child(music_player)
	music_player.volume_db = -1  
	music_player.play()

func pause_music():
	music_player.stream_paused = true

func resume_music():
	music_player.stream_paused = false

func stop_music():
	music_player.stop()

func play_new_music(path):
	music_player.stream = load(path)
	music_player.play()
