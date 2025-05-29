extends Node

var music_player: AudioStreamPlayer

func _ready():
	music_player = AudioStreamPlayer.new()
	music_player.stream = load("res://musica/musica.mp3")  # Cambia por tu archivo real
	add_child(music_player)
	music_player.play()
	
	
	
