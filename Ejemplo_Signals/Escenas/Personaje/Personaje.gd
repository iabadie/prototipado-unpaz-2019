extends KinematicBody2D

const colorNormal = Color(0.05,1,0.07,1);
const colorResaltado = Color(0.85,0.1,1,1);
const MAX_VEL = 300;
const PASOS = 20;
var velocidad = Vector2(0,0);
var puntos = 0

signal sumar_punto;

func _ready():
	$Puntaje.text = String(puntos) + " de 3";
	$Sprite.modulate = colorNormal;
	pass # Replace with function body.

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_left") and velocidad.x > -MAX_VEL:
		velocidad.x -= PASOS;
	if Input.is_action_pressed("ui_right") and velocidad.x < MAX_VEL:
		velocidad.x += PASOS;
	if Input.is_action_pressed("ui_up") and velocidad.y > -MAX_VEL:
		velocidad.y -= PASOS;
	if Input.is_action_pressed("ui_down") and velocidad.y < MAX_VEL:
		velocidad.y += PASOS;
	
	move_and_slide(velocidad);


func _on_Timer_timeout():
	$Sprite.modulate = colorNormal
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	emit_signal("sumar_punto", true, velocidad, PASOS);
	print("EMITI SEÑAL")
	puntos += 1;
	$Puntaje.text = String(puntos) + " de 3";
	$Sprite.modulate = colorResaltado
	$Timer.start()
	pass # Replace with function body.

