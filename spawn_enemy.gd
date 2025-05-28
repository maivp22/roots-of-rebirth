extends Area2D

@onready var Enemy_Scene = load("res://Scenes/enemy.tscn")
var bool_spawn = true

var random = RandomNumberGenerator.new()

func _ready() -> void:
	random.randomize()

func _process(delta: float) -> void:
	spawn()
	

func spawn():
	if bool_spawn:
		$cooldown.start()
		bool_spawn = false
		var enemi_instance = Enemy_Scene.instantiate()
		enemi_instance.position = Vector2(random.randi_range(82, 1200), random.randi_range(450,1600))
		add_child(enemi_instance)
		

func _on_cooldown_timeout():
	bool_spawn = true
