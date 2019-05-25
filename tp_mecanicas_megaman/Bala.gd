extends Sprite

var disparo_grande = preload("res://disparo_grande.png")
var disparo_chico = preload("res://disparo_chico.png")
var pos
func _ready():
	# Registro el valor inicial en donde se instanció la bala, para poder usar la coordenada y
	# En el movimiento y que la bala sea independiente del personaje
	# Esta no es la implementacion correcta, pero funciona para lo que queriamos mostrar.
	pos = global_position

func _inicializar(size):
	# Al inicializar se recibe un "Tipo" el cual es utilizado por Bala para AUTODEFINIR cual es el tipo de bala 
	# Que debe disparar.
	if size == tipos_balas.BALA_CHICA:
		$Sprite.texture = disparo_chico
	if size == tipos_balas.BALA_GRANDE:
		$Sprite.texture = disparo_grande
	pass

func _process(delta):
	# Movimiento automático
	global_position = Vector2(global_position.x + 10, pos.y)
	pass