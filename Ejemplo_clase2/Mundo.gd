extends Node2D

var contador = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Jugador.connect("destruido", self, "sumar_punto")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func sumar_punto():
	contador += 1
	print(contador)