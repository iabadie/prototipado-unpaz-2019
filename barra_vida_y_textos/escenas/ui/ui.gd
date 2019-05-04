extends CanvasLayer
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Vida.text = String($BarraDeVida/ProgressBar.value)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SimulaEvento_timeout():
	#Simula un evento como un golpe de un enemigo
	# Aplico efectos sobre la barra de vida
	$BarraDeVida/ProgressBar.value -= 10
	#Reflejo en un texto el cambio de la vida
	$Vida.text = String($BarraDeVida/ProgressBar.value)
	if ($BarraDeVida/ProgressBar.value == 0):
		$SimulaEvento.stop()
		$Vida.text = "PERDISTE"
		
	pass # Replace with function body.
