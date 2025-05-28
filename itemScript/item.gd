class_name Item extends Area2D

enum ItemType { HOE, SPEAR, BUCKET }

@export var type:ItemType

func collect_item():
	queue_free()

func get_texture() -> CompressedTexture2D:
	return $Sprite2D.texture
