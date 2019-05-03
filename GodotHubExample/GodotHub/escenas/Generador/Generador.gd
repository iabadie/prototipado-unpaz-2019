extends Node2D

var Objetivo = preload("res://escenas/Generador/Objetivo.tscn")

func _ready():
	$Timer.start()
	var objetivoInstancia = Objetivo.instance() # Crea una instancia de Objetivo
	add_child(objetivoInstancia)
	pass # Replace with function body.


func _on_Timer_timeout():
	var objetivoInstancia = Objetivo.instance() # Crea una instancia de Objetivo
	add_child(objetivoInstancia)
	pass
