extends Camera2D

# cuánto queremos acercar; valores menores = más cerca, mayores = más lejos
@export var target_zoom: Vector2 = Vector2(2.5, 2.5)
# velocidad de suavizado (pon 0 para cambio instantáneo)
@export var smooth_speed: float = 5.0

var _current_zoom: Vector2

func _ready():
	make_current()            # convierte esta cámara en la activa
	_current_zoom = zoom      # guardamos el zoom inicial

func _process(delta):
	if smooth_speed > 0:
		_current_zoom = _current_zoom.lerp(target_zoom, smooth_speed * delta)
		zoom = _current_zoom
	else:
		zoom = target_zoom
