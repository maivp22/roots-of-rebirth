extends Node

var music_player: AudioStreamPlayer

func _ready():
	music_player = AudioStreamPlayer.new()
	music_player.stream = load("res://musica/musica.mp3") 
	if music_player.stream:
		music_player.stream.loop = true
	add_child(music_player)
	music_player.play()


	
