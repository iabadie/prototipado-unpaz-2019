extends KinematicBody2D

var bala = preload("res://Bala.tscn")
# Variable para controlar si el jugador puede o no disparar
var puede_disparar = true
# Variable que se activa cuando el jugador mantiene apretado el oton de disparo
var cargando = false
# Luego de finalizar el timer de carga, esta variable controla si ya puede realizar el disparo grande
var carga_completa = false

# Vector que apunta "hacia arriba" para indicarle al move_and_slide como calcular si esta en el piso
var vector_normal = Vector2(0,-1)

var velocity = Vector2()


func _physics_process(delta):
	# gravedad siempre actuando
	velocity.y += 40
	# Detectar cuando esta en el piso y reduce la velocidad por la gravedad, a cero
	if is_on_floor():
		velocity.y = 0
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y -= 800 # aplico salto
		
	move_and_slide(velocity, vector_normal)
	pass
	

func _process(delta):
	# si apreto tecla derecha, dispara la bala comun
	if Input.is_action_just_pressed("ui_right"):
		if puede_disparar:
			disparar(tipos_balas.BALA_CHICA)
	
	# Si mantengo apretado el de disparo y no está cargando el disparo grande, comienza a cargar e inica el timer de carga
	if Input.is_action_pressed("ui_right"):
		if not cargando:
			cargando = true
			$TimerDisparoGrande.start()
			
	# Al soltar el botón de disparo deja de cargar y detiene el timer. Si la carga estaba compelta, realiza el disparo grande.
	if Input.is_action_just_released("ui_right"):
		cargando = false
		$TimerDisparoGrande.stop()
		if carga_completa:
			disparar(tipos_balas.BALA_GRANDE)
			carga_completa = false
	
	## Sección de movimiento de personaje.... completar ustedes
	pass	

# Esta función crea una instancia de bala chica o grande
func disparar(size):
	# Instancia una bala desde el recurso bala y luego INICIALIZA diciendole el tipo (Ver Bala.gd)
	var nueva_bala =bala.instance()
	nueva_bala._inicializar(size)
	add_child(nueva_bala);
	# Para que no pueda disparar
	puede_disparar = false
	# cuenta x tiempo hasta que puede disparar de nuevo
	$TimerDisparo.start()


func _on_Disparo_timeout():
	puede_disparar = true;
	pass

func _on_TimerDisparoGrande_timeout():
	carga_completa = true
	pass
