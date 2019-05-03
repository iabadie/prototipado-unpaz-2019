extends Node2D

var puntos = 0;

func _ready():
	$Personaje.connect("sumar_punto", self, "sumar_puntos");
	pass

func sumar_puntos(esUsuario, vel, pas):
	print(esUsuario, vel, pas)
	puntos+=1;
	if puntos == 3:
		$Cartel.text = "GANASTE";