extends CharacterBody2D

var speed = 70
var player_chase = false
var player = null
var last_direction = "front"  # Guardamos la última dirección: "front", "back" o "side"
var last_flip_h = false       # Para recordar si estaba volteado o no

func _physics_process(delta: float):
	if player_chase and player != null:
		var direction = player.position - position
		position += direction/speed
		
		if abs(direction.x) > abs(direction.y):
			$AnimatedSprite2D.play("side_walk")
			$AnimatedSprite2D.flip_h = direction.x > 0
			last_direction = "side"
			last_flip_h = $AnimatedSprite2D.flip_h
			
		elif direction.y < 0:
			$AnimatedSprite2D.play("back_walk")
			$AnimatedSprite2D.flip_h = false
			last_direction = "back"
			
		else:
			$AnimatedSprite2D.play("front_walk")
			$AnimatedSprite2D.flip_h = false
			last_direction = "front"
			
	else:
		# Cuando no persigue, mostrar el idle según la última dirección guardada
		if last_direction == "side":
			$AnimatedSprite2D.flip_h = last_flip_h
			$AnimatedSprite2D.play("side_idle")
			
		elif last_direction == "back":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("back_idle")
			
		else:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("front_idle")
		
   

func _on_detection_area_body_entered(body: Node2D):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body: Node2D):
	player = null
	player_chase = false
