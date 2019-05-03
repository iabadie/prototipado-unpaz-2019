extends KinematicBody2D
# KinematicBodi2D es un Nodo creado especificamente para darle y manejar el movimiento
# de personajes. 

# Definición de variables que se usarán en el código;
var velocidad = Vector2(0,0);
var gravedad = 20;


# Phisics_process es un método que se llama x veces por segundo
# Segun la velocidad de procesamiento de gráficos.
func _physics_process(delta):
	
	
	velocidad.y += gravedad;
	
	# Los if son para detectar cuando el usuario
	# presiona un botón y setear la nueva velocidad
	if Input.is_action_pressed("ui_right")and velocidad.x < 500:
		velocidad.x += 10;
	if Input.is_action_pressed("ui_left") and velocidad.x > -500:
		velocidad.x -= 10;
	if Input.is_action_just_released("ui_right"):
		velocidad.x = 0;
	if Input.is_action_just_released("ui_left"):
		velocidad.x = 0;
	
	if Input.is_action_just_pressed("ui_up"):
		velocidad.y = -200
	
	print(velocidad)
	# Move and slide genera automaticamente el
	# movimiento del personaje dada una velocidad
	# La velocidad es un vector.
	move_and_slide(velocidad)
